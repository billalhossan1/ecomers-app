// class Product {
//   String? sId;
//   String? title;
//   String? brand;
//   List<String>? categories;
//   String? slug;
//   String? metaDescription;
//   String? description;
//   List<String>? photos;
//   List<String>? colors;
//   List<String>? sizes;
//   List<String>? tags;
//   int? regularPrice;
//   int? currentPrice;
//   int? quantity;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//
//   Product(
//       {this.sId,
//         this.title,
//         this.brand,
//         this.categories,
//         this.slug,
//         this.metaDescription,
//         this.description,
//         this.photos,
//         this.colors,
//         this.sizes,
//         this.tags,
//         this.regularPrice,
//         this.currentPrice,
//         this.quantity,
//         this.createdAt,
//         this.updatedAt,
//         this.iV});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     title = json['title'];
//     brand = json['brand'];
//     categories = (json['categories'] as List?)?.cast<String>();
//     slug = json['slug'];
//     metaDescription = json['meta_description'];
//     description = json['description'];
//     photos = (json['photos'] as List?)?.cast<String>();
//     colors = (json['colors'] as List?)?.cast<String>();
//     sizes = (json['sizes'] as List?)?.cast<String>();
//     tags = (json['tags'] as List?)?.cast<String>();
//     regularPrice = json['regular_price'];
//     currentPrice = json['current_price'];
//     quantity = json['quantity'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() => {
//     '_id': sId,
//     'title': title,
//     'brand': brand,
//     'categories': categories,
//     'slug': slug,
//     'meta_description': metaDescription,
//     'description': description,
//     'photos': photos,
//     'colors': colors,
//     'sizes': sizes,
//     'tags': tags,
//     'regular_price': regularPrice,
//     'current_price': currentPrice,
//     'quantity': quantity,
//     'createdAt': createdAt,
//     'updatedAt': updatedAt,
//     '__v': iV,
//   };
// }
import 'product_list_model.dart';

class ProductDetailsModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  ProductDetailsModel({this.code, this.status, this.msg, this.data});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  String? sId;
  String? title;
  Brand? brand;
  List<Categories>? categories;
  String? slug;
  String? metaDescription;
  String? description;
  List<String>? photos;
  List<String>? colors;
  List<String>? sizes;
  List<String>? tags;
  String? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data({
    this.sId,
    this.title,
    this.brand,
    this.categories,
    this.slug,
    this.metaDescription,
    this.description,
    this.photos,
    this.colors,
    this.sizes,
    this.tags,
    this.regularPrice,
    this.currentPrice,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = json['photos']?.cast<String>();
    colors = json['colors']?.cast<String>();
    sizes = json['sizes']?.cast<String>();
    tags = json['tags']?.cast<String>();
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

}


class Brand {
  String? sId;
  String? title;
  String? slug;
  String? icon;

  Brand({this.sId, this.title, this.slug, this.icon});

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    icon = json['icon'];
  }
}
