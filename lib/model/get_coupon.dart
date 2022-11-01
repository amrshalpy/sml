class GetCouponeModel {
  List<Data>? data;
  int? status;
  String? message;

  GetCouponeModel({this.data, this.status, this.message});

  GetCouponeModel.fromJson(Map<String, dynamic> json) {
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
  Sport? sport;
  String? name;
  String? address;
  int? price;
  int? discount;
  int? afterDiscount;
  Null? image;
  String? createdAt;

  Data(
      {this.id,
      this.sport,
      this.name,
      this.address,
      this.price,
      this.discount,
      this.afterDiscount,
      this.image,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    name = json['name'];
    address = json['address'];
    price = json['price'];
    discount = json['discount'];
    afterDiscount = json['after_discount'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    data['name'] = this.name;
    data['address'] = this.address;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['after_discount'] = this.afterDiscount;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Sport {
  int? id;
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