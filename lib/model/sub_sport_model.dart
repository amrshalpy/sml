class SubSportModel {
  List<Data> data=[];
  String? message;
  List<String>? errors;

  // SubSportModel({this.data, this.message, this.errors});

  SubSportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    if (json['errors'] != null) {
      errors = <String>[];
     
    }
  }

 
}

class Data {
  dynamic id;
  String? name;
  int? sportId;
  int? numberOfUsers;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.sportId,
      this.numberOfUsers,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    numberOfUsers = json['number_of_users'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sport_id'] = this.sportId;
    data['number_of_users'] = this.numberOfUsers;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}