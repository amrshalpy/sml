class PTestUsers {
  List<Data>? data;
  int? status;
  String? message;

  PTestUsers({this.data, this.status, this.message});

  PTestUsers.fromJson(Map<String, dynamic> json) {
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
  int? status;
  String? attendanceTime;
  int? save;
  User? user;

  Data({this.id, this.status, this.attendanceTime, this.save, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    attendanceTime = json['attendance_time'];
    save = json['save'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['attendance_time'] = this.attendanceTime;
    data['save'] = this.save;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
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
