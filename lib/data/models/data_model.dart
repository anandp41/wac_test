class DataModel {
  String id;
  String type;
  String title;
  List<Content> contents;
  String? imageUrl;

  DataModel({
    required this.type,
    required this.title,
    required this.contents,
    this.imageUrl,
    required this.id,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    var contentList = json['contents'] as List<dynamic>?;
    List<Content> contents = contentList != null
        ? contentList
            .map((i) => Content.fromJson(i as Map<String, dynamic>))
            .toList()
        : [];
    return DataModel(
      type: json['type'],
      title: json['title'],
      contents: contents,
      imageUrl: json['image_url'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'contents': contents.map((content) => content.toJson()).toList(),
      'image_url': imageUrl,
      'id': id,
    };
  }
}

class Content {
  String? title;
  String? imageUrl;
  String? sku;
  String? productName;
  String? productImage;
  int? productRating;
  String? actualPrice;
  String? offerPrice;
  String? discount;

  Content({
    this.title,
    this.imageUrl,
    this.sku,
    this.productName,
    this.productImage,
    this.productRating,
    this.actualPrice,
    this.offerPrice,
    this.discount,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      title: json['title'],
      imageUrl: json['image_url'],
      sku: json['sku'],
      productName: json['product_name'],
      productImage: json['product_image'],
      productRating: json['product_rating'],
      actualPrice: json['actual_price'],
      offerPrice: json['offer_price'],
      discount: json['discount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image_url': imageUrl,
      'sku': sku,
      'product_name': productName,
      'product_image': productImage,
      'product_rating': productRating,
      'actual_price': actualPrice,
      'offer_price': offerPrice,
      'discount': discount,
    };
  }
}
