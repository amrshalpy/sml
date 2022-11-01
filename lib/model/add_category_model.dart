class AddCategoryModel {
  String? message;
  Data? data;
  int? status;

  AddCategoryModel({this.message, this.data, this.status});

  AddCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

 
}

class Data {
  FData? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new FData.fromJson(json['data']) : null;
  }

 
}

class FData {
  int? id;
  String? name;
  String? type;
  String? typeName;
  Parent? parent;

  FData({this.id, this.name, this.type, this.typeName, this.parent});

  FData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    typeName = json['typeName'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
  }

  
}

class Parent {
  int? id;
  String? name;
  int? type;
  Null parentId;
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
