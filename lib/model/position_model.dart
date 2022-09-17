class PositionModel {
  List<Data> data=[];
  String? message;
  List<Null>? errors;

  // PositionModel({this.data, this.message, this.errors});

  PositionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
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
      data['data'] = this.data.map((v) => v.toJson()).toList();
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
  String? name;
  int? sportId;
  String? positionType;
  String? positionShortcut;
  int? positionId;
  String? createdAt;
  String? updatedAt;
  int? accountTypeId;
  Sport? sport;
  List<Positions>? positions;

  Data(
      {this.id,
      this.name,
      this.sportId,
      this.positionType,
      this.positionShortcut,
      this.positionId,
      this.createdAt,
      this.updatedAt,
      this.accountTypeId,
      this.sport,
      this.positions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    positionType = json['position_type'];
    positionShortcut = json['position_shortcut'];
    positionId = json['position_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountTypeId = json['account_type_id'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    if (json['positions'] != null) {
      positions = <Positions>[];
      json['positions'].forEach((v) {
        positions!.add(new Positions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sport_id'] = this.sportId;
    data['position_type'] = this.positionType;
    data['position_shortcut'] = this.positionShortcut;
    data['position_id'] = this.positionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['account_type_id'] = this.accountTypeId;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.positions != null) {
      data['positions'] = this.positions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sport {
  int? id;
  String? name;
  int? sportId;
  int? numberOfUsers;
  String? createdAt;
  String? updatedAt;
  int? isUserAdd;

  Sport(
      {this.id,
      this.name,
      this.sportId,
      this.numberOfUsers,
      this.createdAt,
      this.updatedAt,
      this.isUserAdd});

  Sport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    numberOfUsers = json['number_of_users'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isUserAdd = json['is_user_add'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sport_id'] = this.sportId;
    data['number_of_users'] = this.numberOfUsers;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_user_add'] = this.isUserAdd;
    return data;
  }
}

class Positions {
  int? id;
  String? name;
  int? sportId;
  String? positionType;
  String? positionShortcut;
  int? positionId;
  String? createdAt;
  String? updatedAt;
  int? accountTypeId;

  Positions(
      {this.id,
      this.name,
      this.sportId,
      this.positionType,
      this.positionShortcut,
      this.positionId,
      this.createdAt,
      this.updatedAt,
      this.accountTypeId});

  Positions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    positionType = json['position_type'];
    positionShortcut = json['position_shortcut'];
    positionId = json['position_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountTypeId = json['account_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sport_id'] = this.sportId;
    data['position_type'] = this.positionType;
    data['position_shortcut'] = this.positionShortcut;
    data['position_id'] = this.positionId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['account_type_id'] = this.accountTypeId;
    return data;
  }
}