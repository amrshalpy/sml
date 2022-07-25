class SportModel {
  List<Data>? data;
  String? message;
  List<String>? errors;

  SportModel({this.data, this.message, this.errors});

  SportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    // if (json['errors'] != null) {
    //   errors = <String>[];
    //   json['errors'].forEach((v) {
    //     errors!.add(new String.fromJson(v));
    //   });
    // }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   data['message'] = this.message;
  //   if (this.errors != null) {
  //     data['errors'] = this.errors!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }

}

class Data {
  int? id;
  String? name;
  String? sportId;
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