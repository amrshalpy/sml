class AddCouponModel {
  String? message;
  Data? data;
  int? status;

  AddCouponModel({this.message, this.data, this.status});

  AddCouponModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  Sport? sport;
  String? name;
  String? address;
  Null? price;
  String? discount;
  int? afterDiscount;
  Null? image;
  String? createdAt;

  FData(
      {this.id,
      this.sport,
      this.name,
      this.address,
      this.price,
      this.discount,
      this.afterDiscount,
      this.image,
      this.createdAt});

  FData.fromJson(Map<String, dynamic> json) {
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