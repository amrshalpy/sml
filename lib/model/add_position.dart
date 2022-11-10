class AddPositionModel {
  String? message;
  Data? data;
  Null status;

  AddPositionModel({this.message, this.data, this.status});

  AddPositionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  FData? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new FData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FData {
  Null id;
  String? name;
  Sport? sport;
  Category? category;
  Null usersCount;

  FData({this.id, this.name, this.sport, this.category, this.usersCount});

  FData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    usersCount = json['usersCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['usersCount'] = this.usersCount;
    return data;
  }
}

class Sport {
  Null id;
  String? name;
  Null? image;

  Sport({this.id, this.name, this.image});

  Sport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Category {
  Null id;
  String? name;
  Null type;
  String? typeName;
  Parent? parent;

  Category({this.id, this.name, this.type, this.typeName, this.parent});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    typeName = json['typeName'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['typeName'] = this.typeName;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    return data;
  }
}

class Parent {
  Null id;
  String? name;
  Null type;
  Null? parentId;
  String? createdAt;
  String? updatedAt;

  Parent(
      {this.id,
      this.name,
      this.type,
      this.parentId,
      this.createdAt,
      this.updatedAt});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['parent_id'] = this.parentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}