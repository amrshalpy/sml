class GetSportModel {
  List<Data>? data;
  int? status;
  String? message;

  GetSportModel({this.data, this.status, this.message});

  GetSportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Null? type;
  Category? category;
  Null? image;
  int? usersCount;

  Data(
      {this.id,
      this.name,
      this.type,
      this.category,
      this.image,
      this.usersCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    image = json['image'];
    usersCount = json['usersCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['image'] = this.image;
    data['usersCount'] = this.usersCount;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? type;
  String? typeName;
  Null? parent;

  Category({this.id, this.name, this.type, this.typeName, this.parent});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    typeName = json['typeName'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['typeName'] = this.typeName;
    data['parent'] = this.parent;
    return data;
  }
}
