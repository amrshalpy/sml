class CityModel {
  List<Data>? data;
  String? message;
  List<Null>? errors;

  CityModel({this.data, this.message, this.errors});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Null>[];
      json['errors'].forEach((v) {
        errors!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? countryId;
  String? name;
  String? countryCode;

  Data({this.id, this.countryId, this.name, this.countryCode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    return data;
  }
}