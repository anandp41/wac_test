import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../core/api_constant.dart';
import '../../core/functions.dart';
import '../../data/database/database.dart';
import '../../data/models/data_model.dart';
import '../../data/models/json_to_store_model.dart';
import '../../services/api_services.dart';

class HomeViewModel extends ChangeNotifier {
  // Create lists to store sorted data models
  bool emptyData = true;
  DataModel? bannerSliders;
  DataModel? bestSellers;
  DataModel? mostPopulars;
  DataModel? bannerSingle;
  DataModel? categories;
  String storedJsonString = '';
  String jsonReceivedFromAPI = '';

  List<Image> bannerSlidersImages = [];
  List<Image> bestSellersImages = [];
  List<Image> mostPopularsImages = [];
  late Image bannerSingleImage;
  List<Image> categoriesImages = [];

// Fetching from the api

  Future<void> fetchData(context) async {
    try {
      jsonReceivedFromAPI = await ApiService.fetchData(ApiConstant.baseUrl);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    await loadStoredJson();

    if (jsonReceivedFromAPI != storedJsonString) {
      await saveJsonToBeStored();
      final List<dynamic> jsonData = json.decode(jsonReceivedFromAPI);
      List<DataModel> dataModels =
          jsonData.map((item) => DataModel.fromJson(item)).toList();

      // Sort and store data models into respective lists
      for (var dataModel in dataModels) {
        switch (dataModel.type) {
          case 'banner_slider':
            bannerSliders = dataModel;
            break;
          case 'products':
            if (dataModel.title == 'Best Sellers') {
              bestSellers = dataModel;
            } else if (dataModel.title == 'Most Popular') {
              mostPopulars = dataModel;
            }
            break;
          case 'banner_single':
            bannerSingle = dataModel;
            break;
          case 'catagories':
            categories = dataModel;
            break;
        }
      }
      await storeImagesToDisk();
      await loadImagesFromDisk();
      emptyData = false;
      notifyListeners();
    } else if (emptyData) {
      final List<dynamic> jsonData = json.decode(storedJsonString);

      List<DataModel> dataModels =
          jsonData.map((item) => DataModel.fromJson(item)).toList();
// Sort and store data models into respective lists
      for (var dataModel in dataModels) {
        switch (dataModel.type) {
          case 'banner_slider':
            bannerSliders = dataModel;
            break;
          case 'products':
            if (dataModel.title == 'Best Sellers') {
              bestSellers = dataModel;
            } else if (dataModel.title == 'Most Popular') {
              mostPopulars = dataModel;
            }
            break;
          case 'banner_single':
            bannerSingle = dataModel;
            break;
          case 'catagories':
            categories = dataModel;
            break;
        }
      }
      await loadImagesFromDisk();
      emptyData = false;
      notifyListeners();
    }
  }

  Future<String> getDatabasePath(String dbName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, dbName);
    final file = File(path);
    if (!await file.exists()) {
      await file.create(recursive: true);
    }
    // Debugging line
    return path;
  }

  Future<void> loadStoredJson() async {
    final database = await $FloorAppDatabase
        .databaseBuilder(await getDatabasePath('app_database.db'))
        .build();
    final dataDao = database.dataDao;
    var storedData = await dataDao.getStoredData();
    if (storedData != null) {
      storedJsonString = storedData.json;
    }
  }

  Future<void> saveJsonToBeStored() async {
    final database = await $FloorAppDatabase
        .databaseBuilder(await getDatabasePath('app_database.db'))
        .build();
    final toStore = JsonToStore(json: jsonReceivedFromAPI);
    final dataDao = database.dataDao;
    await dataDao.deleteAllData();
    await dataDao.insertData(toStore);
  }

  Future<void> storeImagesToDisk() async {
    List<DataModel?> list = [
      // bannerSingle,
      bannerSliders,
      bestSellers,
      mostPopulars,
      categories
    ];
    for (DataModel? item in list) {
      int i = 0;
      for (var each in item!.contents) {
        saveImage(each.imageUrl ?? each.productImage!,
            "${item.type.replaceAll(' ', '_')}${i.toString()}");
        ++i;
      }
    }
    saveImage(bannerSingle!.imageUrl!, bannerSingle!.type.toString());
  }

  Future<void> loadImagesFromDisk() async {
    List<DataModel?> list = [
      // bannerSingle,
      bannerSliders,
      bestSellers,
      mostPopulars,
      categories
    ];

    List<List<Image>> listsToAddImages = [
      bannerSlidersImages,
      bestSellersImages,
      mostPopularsImages,
      categoriesImages
    ];

    for (int k = 0; k < 4; k++) {
      int i = list[k]!.contents.length;
      for (int count = 0; count < i; count++) {
        String fileName =
            "${list[k]!.type.replaceAll(' ', '_')}${count.toString()}";

        late Image image;
        if (list[k]!.type == 'catagories') {
          image = Image.memory(
            await loadImageFromPath(fileName),
            fit: BoxFit.scaleDown,
            height: 50,
            width: 50,
          );
        } else if (list[k]!.type == 'banner_slider') {
          image = Image.memory(
            await loadImageFromPath(fileName),
            fit: BoxFit.cover,
            // height: 50,
            width: double.infinity,
          );
        } else {
          image = Image.memory(await loadImageFromPath(fileName));
        }

        listsToAddImages[k].add(image);
      }
    }

    bannerSingleImage = Image.memory(
      await loadImageFromPath(bannerSingle!.type.toString()),
      height: 80,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
