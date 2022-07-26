class SportModel {
  List<Data> data=[];
  String? message;
  // List<Null>? errors;

  // SportModel({this.data, this.message, this.errors});

  SportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add( Data.fromJson(v));
      });
    }
    message = json['message'];
    
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

  
}