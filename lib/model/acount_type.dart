class AccountTypeModel {
  List<Data>? data;
  String? message;
  List<String>? errors;

  AccountTypeModel({this.data, this.message, this.errors});

  AccountTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
  int? id;
  String? name;
  String? type;

  Data({this.id, this.name, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}
