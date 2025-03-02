// import 'product_model.dart';
//
// class ProductListModel {
//   int? code;
//   String? status;
//   String? msg;
//   Data? data;
//
//   ProductListModel({this.code, this.status, this.msg, this.data});
//
//   ProductListModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     msg = json['msg'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() => {
//     'code': code,
//     'status': status,
//     'msg': msg,
//     'data': data?.toJson(),
//   };
// }
//
// class Data {
//   List<ProductModel>? productList;
//   int? total;
//   int? firstPage;
//   int? previous;
//   int? next;
//   int? lastPage;
//   Data({this.productList, this.total, this.firstPage, this.previous, this.next, this.lastPage});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     productList = (json['results'] as List?)?.map((v) => ProductModel.fromJson(v)).toList();
//     total = json['total'];
//     firstPage = json['first_page'];
//     previous = json['previous'];
//     next = json['next'];
//     lastPage = json['last_page'];
//   }
//
//   Map<String, dynamic> toJson() => {
//     'results': productList?.map((v) => v.toJson()).toList(),
//     'total': total,
//     'first_page': firstPage,
//     'previous': previous,
//     'next': next,
//     'last_page': lastPage,
//   };
// }
//
// class ProductModel {
//   String? sId;
//   Product? product;
//   String? user;
//   int? quantity;
//   String? color;
//   String? size;
//   String? createdAt;
//   String? updatedAt;
//   double? iV;
//
//   ProductModel({this.sId, this.product, this.user, this.quantity, this.color, this.size, this.createdAt, this.updatedAt, this.iV});
//
//   ProductModel.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     product = json['product'] != null ? Product.fromJson(json['product']) : null;
//     user = json['user'];
//     quantity = json['quantity'];
//     color = json['color'];
//     size = json['size'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() => {
//     '_id': sId,
//     'product': product?.toJson(),
//     'user': user,
//     'quantity': quantity,
//     'color': color,
//     'size': size,
//     'createdAt': createdAt,
//     'updatedAt': updatedAt,
//     '__v': iV,
//   };
// }
class ProductListModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  ProductListModel({this.code, this.status, this.msg, this.data});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<ProductModel>? results;
  int? total;
  int? next;
  int? lastPage;

  Data({this.results, this.total, this.next, this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(ProductModel.fromJson(v));
      });
    }
    total = json['total'];
    next = json['next'];
    lastPage = json['last_page'];
  }

}

class ProductModel {
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
  int? regularPrice;
  int? currentPrice;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  bool? inCart;
  bool? inWishlist;

  ProductModel({
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
    this.inCart,
    this.inWishlist,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;

    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    slug = json['slug'];
    metaDescription = json['meta_description'];
    description = json['description'];
    photos = json['photos'] != null ? List<String>.from(json['photos']) : [];
    colors = json['colors'] != null ? List<String>.from(json['colors']) : [];
    sizes = json['sizes'] != null ? List<String>.from(json['sizes']) : [];
    tags = json['tags'] != null ? List<String>.from(json['tags']) : [];
    regularPrice = json['regular_price'];
    currentPrice = json['current_price'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    inCart = json['in_cart'];
    inWishlist = json['in_wishlist'];
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['title'] = title;
    data['slug'] = slug;
    data['icon'] = icon;
    return data;
  }
}

class Categories {
  String? sId;
  String? title;

  Categories({this.sId, this.title});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['title'] = title;
    return data;
  }
}


