import 'product_model.dart';

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

  Map<String, dynamic> toJson() => {
    'code': code,
    'status': status,
    'msg': msg,
    'data': data?.toJson(),
  };
}

class Data {
  List<ProductModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  Data({this.results, this.total, this.firstPage, this.previous, this.next, this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    results = (json['results'] as List?)?.map((v) => ProductModel.fromJson(v)).toList();
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() => {
    'results': results?.map((v) => v.toJson()).toList(),
    'total': total,
    'first_page': firstPage,
    'previous': previous,
    'next': next,
    'last_page': lastPage,
  };
}

class ProductModel {
  String? sId;
  Product? product;
  String? user;
  int? quantity;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductModel({this.sId, this.product, this.user, this.quantity, this.color, this.size, this.createdAt, this.updatedAt, this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    user = json['user'];
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() => {
    '_id': sId,
    'product': product?.toJson(),
    'user': user,
    'quantity': quantity,
    'color': color,
    'size': size,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': iV,
  };
}


