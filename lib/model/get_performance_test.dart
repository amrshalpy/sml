class GetPerformanceTest {
  List<Data>? data;
  int? status;
  String? message;

  GetPerformanceTest({this.data, this.status, this.message});

  GetPerformanceTest.fromJson(Map<String, dynamic> json) {
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
  int? active;
  Type? type;
  User? user;
  Type? sport;
  Position? position;
  String? startAt;
  String? dateFrom;
  String? dateTo;
  int? ageFrom;
  int? ageTo;
  int? maxUser;
  String? createdAt;
  int? viewCount;
  int? likeCount;
  int? shareCount;

  Data(
      {this.id,
      this.active,
      this.type,
      this.user,
      this.sport,
      this.position,
      this.startAt,
      this.dateFrom,
      this.dateTo,
      this.ageFrom,
      this.ageTo,
      this.maxUser,
      this.createdAt,
      this.viewCount,
      this.likeCount,
      this.shareCount});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    sport = json['sport'] != null ? new Type.fromJson(json['sport']) : null;
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
    startAt = json['start_at'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    ageFrom = json['age_from'];
    ageTo = json['age_to'];
    maxUser = json['max_user'];
    createdAt = json['created_at'];
    viewCount = json['view_count'];
    likeCount = json['like_count'];
    shareCount = json['share_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    data['start_at'] = this.startAt;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    data['age_from'] = this.ageFrom;
    data['age_to'] = this.ageTo;
    data['max_user'] = this.maxUser;
    data['created_at'] = this.createdAt;
    data['view_count'] = this.viewCount;
    data['like_count'] = this.likeCount;
    data['share_count'] = this.shareCount;
    return data;
  }
}

class Type {
  int? id;
  String? name;
  Null? image;

  Type({this.id, this.name, this.image});

  Type.fromJson(Map<String, dynamic> json) {
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

class User {
  int? id;
  String? name;
  String? image;

  User({this.id, this.name, this.image});

  User.fromJson(Map<String, dynamic> json) {
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

class Position {
  int? id;
  String? name;

  Position({this.id, this.name});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
