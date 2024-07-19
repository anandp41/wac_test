import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<void> saveImage(String imageUrl, String fileName) async {
  // Fetch image data
  final response = await http.get(Uri.parse(imageUrl));
  final imageBytes = response.bodyBytes;

  // Get a directory for storage
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$fileName';

  // Create file and save image
  final file = File(filePath);
  await file.writeAsBytes(imageBytes);
}

Future<Uint8List> loadImageFromPath(String fileName) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/$fileName';
  final file = File(filePath);
  final imageBytes = await file.readAsBytes();
  // var image = await decodeImageFromList(imageBytes);
  return imageBytes;
}
