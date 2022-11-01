class GetComapanyProductModel {
  List<Data>? data;
  int? status;
  String? message;

  GetComapanyProductModel({this.data, this.status, this.message});

  GetComapanyProductModel.fromJson(Map<String, dynamic> json) {
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
  Category? category;
  User? user;

  Data({this.id, this.name, this.category, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? type;
  String? typeName;
  Parents? parent;

  Category({this.id, this.name, this.type, this.typeName, this.parent});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    typeName = json['typeName'];
    parent = json['parent']!=null?Parents.fromJson(json['parent']):null;
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

class Parents {
  int? id;
  String? name;
  int? type;
  String? created;
  String? updated;
  Null parentId;
  Parents(
      {this.parentId,
      this.id,
      this.name,
      this.type,
      this.created,
      this.updated});
  Parents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    created = json['created_at'];
    updated = json['updated_at'];
    parentId = json['parent_id'];
  }
}

class User {
  int? id;
  String? name;
  String? image;
  int? gender;
  String? birthDate;
  String? type;

  User(
      {this.id, this.name, this.image, this.gender, this.birthDate, this.type});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;

    data['type'] = this.type;
    return data;
  }
}
