class PlayerData {
  Data? data;
  String? message;
  List<Null>? errors;

  PlayerData({this.data, this.message, this.errors});

  PlayerData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Null>[];
      json['errors'].forEach((v) {
        errors!.add(v);
      });
    }
  }

  
}

class Data {
  int? id;
  String? countryCode;
  Country? country;
  String? email;
  String? profilePicture;
  int? numberOfViews;
  int? numberOfLikes;
  int? numberOfShares;
  String? qrCodeImage;
  dynamic balance;
  Player? player;
  Null club;
  Null trainer;
  Null doctor;
  Null company;

  Data(
      {this.id,
      this.countryCode,
      this.country,
      this.email,
      this.profilePicture,
      this.numberOfViews,
      this.numberOfLikes,
      this.numberOfShares,
      this.qrCodeImage,
      this.balance,
      this.player,
      this.club,
      this.trainer,
      this.doctor,
      this.company});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    email = json['email'];
    profilePicture = json['profile_picture'];
    numberOfViews = json['number_of_views'];
    numberOfLikes = json['number_of_likes'];
    numberOfShares = json['number_of_shares'];
    qrCodeImage = json['qr_code_image'];
    balance = json['balance'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    club = json['club'];
    trainer = json['trainer'];
    doctor = json['doctor'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_code'] = this.countryCode;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['email'] = this.email;
    data['profile_picture'] = this.profilePicture;
    data['number_of_views'] = this.numberOfViews;
    data['number_of_likes'] = this.numberOfLikes;
    data['number_of_shares'] = this.numberOfShares;
    data['qr_code_image'] = this.qrCodeImage;
    data['balance'] = this.balance;
    if (this.player != null) {
      data['player'] = this.player!.toJson();
    }
    data['club'] = this.club;
    data['trainer'] = this.trainer;
    data['doctor'] = this.doctor;
    data['company'] = this.company;
    return data;
  }
}

class Country {
  int? id;
  String? iso2;
  String? name;
  int? status;
  String? phoneCode;
  String? iso3;
  String? region;
  String? subregion;

  Country(
      {this.id,
      this.iso2,
      this.name,
      this.status,
      this.phoneCode,
      this.iso3,
      this.region,
      this.subregion});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iso2 = json['iso2'];
    name = json['name'];
    status = json['status'];
    phoneCode = json['phone_code'];
    iso3 = json['iso3'];
    region = json['region'];
    subregion = json['subregion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iso2'] = this.iso2;
    data['name'] = this.name;
    data['status'] = this.status;
    data['phone_code'] = this.phoneCode;
    data['iso3'] = this.iso3;
    data['region'] = this.region;
    data['subregion'] = this.subregion;
    return data;
  }
}

class Player {
  int? id;
  Sport? sport;
  Country? nationality;
  Country? livingCountry;
  LivingCity? livingCity;
  String? dateOfBirth;
  String? gender;
  int? height;
  String? heightUnit;
  int? weight;
  String? limbsDirection;
  int? runningTime;
  dynamic verticalJumpingDistance;
  String? verticalJumpingDistanceUnit;
  dynamic longJumpingDistance;
  String? longJumpingDistanceUnit;
  int? liftingArmsWeights;
  String? liftingArmsWeightsUnit;
  int? liftingLegWeights;
  String? liftingLegWeightsUnit;
  Position? position;
  Null club;
  State? state;

  Player(
      {this.id,
      this.sport,
      this.nationality,
      this.livingCountry,
      this.livingCity,
      this.dateOfBirth,
      this.gender,
      this.height,
      this.heightUnit,
      this.weight,
      this.limbsDirection,
      this.runningTime,
      this.verticalJumpingDistance,
      this.verticalJumpingDistanceUnit,
      this.longJumpingDistance,
      this.longJumpingDistanceUnit,
      this.liftingArmsWeights,
      this.liftingArmsWeightsUnit,
      this.liftingLegWeights,
      this.liftingLegWeightsUnit,
      this.position,
      this.club,
      this.state});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
    nationality = json['nationality'] != null
        ? new Country.fromJson(json['nationality'])
        : null;
    livingCountry = json['living_country'] != null
        ? new Country.fromJson(json['living_country'])
        : null;
    livingCity = json['living_city'] != null
        ? new LivingCity.fromJson(json['living_city'])
        : null;
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    height = json['height'];
    heightUnit = json['height_unit'];
    weight = json['weight'];
    limbsDirection = json['limbs_direction'];
    runningTime = json['running_time'];
    verticalJumpingDistance = json['vertical_jumping_distance'];
    verticalJumpingDistanceUnit = json['vertical_jumping_distance_unit'];
    longJumpingDistance = json['long_jumping_distance'];
    longJumpingDistanceUnit = json['long_jumping_distance_unit'];
    liftingArmsWeights = json['lifting_arms_weights'];
    liftingArmsWeightsUnit = json['lifting_arms_weights_unit'];
    liftingLegWeights = json['lifting_leg_weights'];
    liftingLegWeightsUnit = json['lifting_leg_weights_unit'];
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
    club = json['club'];
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.nationality != null) {
      data['nationality'] = this.nationality!.toJson();
    }
    if (this.livingCountry != null) {
      data['living_country'] = this.livingCountry!.toJson();
    }
    if (this.livingCity != null) {
      data['living_city'] = this.livingCity!.toJson();
    }
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['height_unit'] = this.heightUnit;
    data['weight'] = this.weight;
    data['limbs_direction'] = this.limbsDirection;
    data['running_time'] = this.runningTime;
    data['vertical_jumping_distance'] = this.verticalJumpingDistance;
    data['vertical_jumping_distance_unit'] = this.verticalJumpingDistanceUnit;
    data['long_jumping_distance'] = this.longJumpingDistance;
    data['long_jumping_distance_unit'] = this.longJumpingDistanceUnit;
    data['lifting_arms_weights'] = this.liftingArmsWeights;
    data['lifting_arms_weights_unit'] = this.liftingArmsWeightsUnit;
    data['lifting_leg_weights'] = this.liftingLegWeights;
    data['lifting_leg_weights_unit'] = this.liftingLegWeightsUnit;
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    data['club'] = this.club;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
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

class LivingCity {
  int? id;
  int? countryId;
  int? stateId;
  String? name;
  String? countryCode;

  LivingCity(
      {this.id, this.countryId, this.stateId, this.name, this.countryCode});

  LivingCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    name = json['name'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['name'] = this.name;
    data['country_code'] = this.countryCode;
    return data;
  }
}

class Position {
  int? id;
  String? name;
  int? sportId;
  String? positionType;
  String? positionShortcut;
  int? positionId;
  String? createdAt;
  String? updatedAt;
  int? accountTypeId;

  Position(
      {this.id,
      this.name,
      this.sportId,
      this.positionType,
      this.positionShortcut,
      this.positionId,
      this.createdAt,
      this.updatedAt,
      this.accountTypeId});

  Position.fromJson(Map<String, dynamic> json) {
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

class State {
  int? id;
  int? countryId;
  String? name;
  String? countryCode;

  State({this.id, this.countryId, this.name, this.countryCode});

  State.fromJson(Map<String, dynamic> json) {
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