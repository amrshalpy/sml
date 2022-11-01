// class GetPlayerProfileData {
//   Data? data;
//   String? message;
//   List<Null>? errors;

//   GetPlayerProfileData({this.data, this.message, this.errors});

//   GetPlayerProfileData.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//     if (json['errors'] != null) {
//       errors = <Null>[];
//       json['errors'].forEach((v) {
//         errors!.add(v);
//       });
//     }
//   }
// }

// class Data {
//   int? id;
//   String? countryCode;
//   String? name;
//   Country? country;
//   String? email;
//   String? profilePicture;
//   int? numberOfViews;
//   int? numberOfLikes;
//   int? numberOfShares;
//   String? qrCodeImage;
//   int? balance;
//   Player? player;
//   Null club;
//   Null trainer;
//   Null doctor;
//   Null company;

//   Data(
//       {this.id,
//       this.countryCode,
//       this.country,
//       this.email,
//       this.profilePicture,
//       this.numberOfViews,
//       this.numberOfLikes,
//       this.numberOfShares,
//       this.qrCodeImage,
//       this.balance,
//       this.player,
//       this.club,
//       this.trainer,
//       this.doctor,
//       this.company});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     countryCode = json['country_code'];
//     country =
//         json['country'] != null ? new Country.fromJson(json['country']) : null;
//     email = json['email'];
//     profilePicture = json['profile_picture'];
//     name = json['name'];
//     numberOfViews = json['number_of_views'];
//     numberOfLikes = json['number_of_likes'];
//     numberOfShares = json['number_of_shares'];
//     qrCodeImage = json['qr_code_image'];
//     balance = json['balance'];
//     player =
//         json['player'] != null ? new Player.fromJson(json['player']) : null;
//     club = json['club'];
//     trainer = json['trainer'];
//     doctor = json['doctor'];
//     company = json['company'];
//   }
// }

// class Country {
//   int? id;
//   String? iso2;
//   String? name;
//   int? status;
//   String? phoneCode;
//   String? iso3;
//   String? region;
//   String? subregion;

//   Country(
//       {this.id,
//       this.iso2,
//       this.name,
//       this.status,
//       this.phoneCode,
//       this.iso3,
//       this.region,
//       this.subregion});

//   Country.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     iso2 = json['iso2'];
//     name = json['name'];
//     status = json['status'];
//     phoneCode = json['phone_code'];
//     iso3 = json['iso3'];
//     region = json['region'];
//     subregion = json['subregion'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['iso2'] = this.iso2;
//     data['name'] = this.name;
//     data['status'] = this.status;
//     data['phone_code'] = this.phoneCode;
//     data['iso3'] = this.iso3;
//     data['region'] = this.region;
//     data['subregion'] = this.subregion;
//     return data;
//   }
// }

// class Player {
//   int? id;
//   Sport? sport;
//   Country? nationality;
//   Country? livingCountry;
//   LivingCity? livingCity;
//   String? dateOfBirth;
//   String? gender;
//   int? height;
//   String? heightUnit;
//   int? weight;
//   String? limbsDirection;
//   int? runningTime;
//   int? verticalJumpingDistance;
//   String? verticalJumpingDistanceUnit;
//   int? longJumpingDistance;
//   String? longJumpingDistanceUnit;
//   int? liftingArmsWeights;
//   String? liftingArmsWeightsUnit;
//   int? liftingLegWeights;
//   String? liftingLegWeightsUnit;
//   Position? position;
//   Null club;
//   State? state;
//   List<Experiences> experiences = [];
//   List<ContactInfos>? contactInfos;
//   List<Skills>? skills;

//   Player.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     sport = json['sport'] != null ? new Sport.fromJson(json['sport']) : null;
//     nationality = json['nationality'] != null
//         ? new Country.fromJson(json['nationality'])
//         : null;
//     livingCountry = json['living_country'] != null
//         ? new Country.fromJson(json['living_country'])
//         : null;
//     livingCity = json['living_city'] != null
//         ? new LivingCity.fromJson(json['living_city'])
//         : null;
//     dateOfBirth = json['date_of_birth'];
//     gender = json['gender'];
//     height = json['height'];
//     heightUnit = json['height_unit'];
//     weight = json['weight'];
//     limbsDirection = json['limbs_direction'];
//     runningTime = json['running_time'];
//     verticalJumpingDistance = json['vertical_jumping_distance'];
//     verticalJumpingDistanceUnit = json['vertical_jumping_distance_unit'];
//     longJumpingDistance = json['long_jumping_distance'];
//     longJumpingDistanceUnit = json['long_jumping_distance_unit'];
//     liftingArmsWeights = json['lifting_arms_weights'];
//     liftingArmsWeightsUnit = json['lifting_arms_weights_unit'];
//     liftingLegWeights = json['lifting_leg_weights'];
//     liftingLegWeightsUnit = json['lifting_leg_weights_unit'];
//     position = json['position'] != null
//         ? new Position.fromJson(json['position'])
//         : null;
//     club = json['club'];
//     state = json['state'] != null ? new State.fromJson(json['state']) : null;
//     if (json['experiences'] != null) {
//       experiences = <Experiences>[];
//       json['experiences'].forEach((v) {
//         experiences.add(new Experiences.fromJson(v));
//       });
//     }
//     if (json['contact_infos'] != null) {
//       contactInfos = <ContactInfos>[];
//       json['contact_infos'].forEach((v) {
//         contactInfos!.add(new ContactInfos.fromJson(v));
//       });
//     }
//     if (json['skills'] != null) {
//       skills = <Skills>[];
//       json['skills'].forEach((v) {
//         skills!.add(new Skills.fromJson(v));
//       });
//     }
//   }
// }

// class Sport {
//   int? id;
//   String? name;
//   int? sportId;
//   int? numberOfUsers;
//   String? createdAt;
//   String? updatedAt;
//   int? isUserAdd;

//   Sport(
//       {this.id,
//       this.name,
//       this.sportId,
//       this.numberOfUsers,
//       this.createdAt,
//       this.updatedAt,
//       this.isUserAdd});

//   Sport.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     sportId = json['sport_id'];
//     numberOfUsers = json['number_of_users'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     isUserAdd = json['is_user_add'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['sport_id'] = this.sportId;
//     data['number_of_users'] = this.numberOfUsers;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['is_user_add'] = this.isUserAdd;
//     return data;
//   }
// }

// class LivingCity {
//   int? id;
//   int? countryId;
//   int? stateId;
//   String? name;
//   String? countryCode;

//   LivingCity(
//       {this.id, this.countryId, this.stateId, this.name, this.countryCode});

//   LivingCity.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     countryId = json['country_id'];
//     stateId = json['state_id'];
//     name = json['name'];
//     countryCode = json['country_code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['country_id'] = this.countryId;
//     data['state_id'] = this.stateId;
//     data['name'] = this.name;
//     data['country_code'] = this.countryCode;
//     return data;
//   }
// }

// class Position {
//   int? id;
//   String? name;
//   int? sportId;
//   String? positionType;
//   String? positionShortcut;
//   int? positionId;
//   String? createdAt;
//   String? updatedAt;
//   int? accountTypeId;

//   Position(
//       {this.id,
//       this.name,
//       this.sportId,
//       this.positionType,
//       this.positionShortcut,
//       this.positionId,
//       this.createdAt,
//       this.updatedAt,
//       this.accountTypeId});

//   Position.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     sportId = json['sport_id'];
//     positionType = json['position_type'];
//     positionShortcut = json['position_shortcut'];
//     positionId = json['position_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     accountTypeId = json['account_type_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['sport_id'] = this.sportId;
//     data['position_type'] = this.positionType;
//     data['position_shortcut'] = this.positionShortcut;
//     data['position_id'] = this.positionId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['account_type_id'] = this.accountTypeId;
//     return data;
//   }
// }

// class State {
//   int? id;
//   int? countryId;
//   String? name;
//   String? countryCode;

//   State({this.id, this.countryId, this.name, this.countryCode});

//   State.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     countryId = json['country_id'];
//     name = json['name'];
//     countryCode = json['country_code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['country_id'] = this.countryId;
//     data['name'] = this.name;
//     data['country_code'] = this.countryCode;
//     return data;
//   }
// }

// class Experiences {
//   int? id;
//   String? clubName;
//   String? startingDate;
//   String? endingDate;
//   String? createdAt;
//   String? updatedAt;
//   int? leagueId;
//   int? positionId;
//     String? leagueType;

//   int? modelId;
//   String? modelType;

//   Experiences(
//       {this.id,
//       this.clubName,
//       this.startingDate,
//       this.endingDate,
//       this.createdAt,
//       this.updatedAt,
//       this.leagueId,
//       this.positionId,
//       this.modelId,
//       this.modelType});

//   Experiences.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     clubName = json['club_name'];
//     startingDate = json['starting_date'];
//     endingDate = json['ending_date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//         leagueType = json['league_type'];

//     leagueId = json['league_id'];
//     positionId = json['position_id'];
//     modelId = json['model_id'];
//     modelType = json['model_type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['club_name'] = this.clubName;
//     data['starting_date'] = this.startingDate;
//     data['ending_date'] = this.endingDate;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['league_id'] = this.leagueId;
//     data['position_id'] = this.positionId;
//     data['model_id'] = this.modelId;
//     data['model_type'] = this.modelType;
//     return data;
//   }
// }

// class ContactInfos {
//   int? id;
//   String? contactType;
//   String? contactValue;
//   String? privacy;
//   String? createdAt;
//   String? updatedAt;
//   int? modelId;
//   String? modelType;

//   ContactInfos(
//       {this.id,
//       this.contactType,
//       this.contactValue,
//       this.privacy,
//       this.createdAt,
//       this.updatedAt,
//       this.modelId,
//       this.modelType});

//   ContactInfos.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     contactType = json['contact_type'];
//     contactValue = json['contact_value'];
//     privacy = json['privacy'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     modelId = json['model_id'];
//     modelType = json['model_type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['contact_type'] = this.contactType;
//     data['contact_value'] = this.contactValue;
//     data['privacy'] = this.privacy;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['model_id'] = this.modelId;
//     data['model_type'] = this.modelType;
//     return data;
//   }
// }

// class Skills {
//   int? id;
//   String? title;
//   String? videoName;
//   int? numberOfViews;
//   int? numberOfLikes;
//   int? numberOfShares;
//   int? modelId;
//   String? modelType;
//   int? isFreestyle;
//   String? createdAt;
//   String? updatedAt;

//   Skills(
//       {this.id,
//       this.title,
//       this.videoName,
//       this.numberOfViews,
//       this.numberOfLikes,
//       this.numberOfShares,
//       this.modelId,
//       this.modelType,
//       this.isFreestyle,
//       this.createdAt,
//       this.updatedAt});

//   Skills.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     videoName = json['video_name'];
//     numberOfViews = json['number_of_views'];
//     numberOfLikes = json['number_of_likes'];
//     numberOfShares = json['number_of_shares'];
//     modelId = json['model_id'];
//     modelType = json['model_type'];
//     isFreestyle = json['is_freestyle'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['video_name'] = this.videoName;
//     data['number_of_views'] = this.numberOfViews;
//     data['number_of_likes'] = this.numberOfLikes;
//     data['number_of_shares'] = this.numberOfShares;
//     data['model_id'] = this.modelId;
//     data['model_type'] = this.modelType;
//     data['is_freestyle'] = this.isFreestyle;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
