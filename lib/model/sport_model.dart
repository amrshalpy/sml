class MainSportsModel {
  List<Data> data = [];
  String? message;
  List<Null>? errors;

  // MainSportsModel({this.data, this.message, this.errors});

  MainSportsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
  int? id;
  String? name;
  Null sportId;
  int? numberOfUsers;
  String? createdAt;
  String? updatedAt;
  int? isUserAdd;

  Data(
      {this.id,
      this.name,
      this.sportId,
      this.numberOfUsers,
      this.createdAt,
      this.updatedAt,
      this.isUserAdd});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    numberOfUsers = json['number_of_users'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isUserAdd = json['is_user_add'];
  }

 
}
