import 'package:flutter/foundation.dart';

class SliderListModel {
  int? code;
  String? status;
  String? msg;
  Data? data;

  SliderListModel({this.code, this.status, this.msg, this.data});

  SliderListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<SliderModel>? results;
  int? total;
  int? firstPage;
  int? previous;
  int? next;
  int? lastPage;

  Data(
      {this.results,
        this.total,
        this.firstPage,
        this.previous,
        this.next,
        this.lastPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <SliderModel>[];
      json['results'].forEach((v) {
        results!.add(SliderModel.fromJson(v));
      });
    }
    total = json['total'];
    firstPage = json['first_page'];
    previous = json['previous'];
    next = json['next'];
    lastPage = json['last_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['first_page'] = firstPage;
    data['previous'] = previous;
    data['next'] = next;
    data['last_page'] = lastPage;
    return data;
  }
}

class SliderModel {
  String? sId;
  String? photoUrl;
  String? description;
  String? product;
  String? brand;
  Category? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SliderModel(
      {this.sId,
        this.photoUrl,
        this.description,
        this.product,
        this.brand,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SliderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    photoUrl = json['photo_url'];
    description = json['description'];
    product = json['product'];
    brand = json['brand'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['photo_url'] = photoUrl;
    data['description'] = description;
    data['product'] = product;
    data['brand'] = brand;
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
