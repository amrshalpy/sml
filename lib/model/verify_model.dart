class VerifyModel {
  String? message;
  Data? data;
  int? status;

  VerifyModel({this.message, this.data, this.status});

  VerifyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? clubName;
  String? clubLogo;
  String? gender;
  int? height;
  int? weight;
  String? manager;
  String? stadium;
  String? founder;
  String? owner;
  String? founded;
  String? birthDate;
  String? companyLocation;
  int? companyType;
  String? website;
  int? viewCount;
  int? likeCount;
  int? shareCount;
  int? titlesCount;
  Country? country;
  City? city;
  Sports? sport;
  Types? type;
  Position? position;
  Nationality? nationality;
  List<Taps>? taps;
  List<Null>? titles;
  List<Null>? certificates;
  List<Null>? experiences;
  Null performance;
  List<Null>? contacts;

  User(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.image,
      this.clubName,
      this.clubLogo,
      this.gender,
      this.height,
      this.weight,
      this.manager,
      this.stadium,
      this.founder,
      this.owner,
      this.founded,
      this.birthDate,
      this.companyLocation,
      this.companyType,
      this.website,
      this.viewCount,
      this.likeCount,
      this.shareCount,
      this.titlesCount,
      this.country,
      this.city,
      this.sport,
      this.type,
      this.position,
      this.nationality,
      this.taps,
      this.titles,
      this.certificates,
      this.experiences,
      this.performance,
      this.contacts});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    clubName = json['club_name'];
    clubLogo = json['club_logo'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    manager = json['manager'];
    stadium = json['stadium'];
    founder = json['founder'];
    owner = json['owner'];
    founded = json['founded'];
    birthDate = json['birth_date'];
    companyLocation = json['company_location'];
    companyType = json['company_type'];
    website = json['website'];
    viewCount = json['view_count'];
    likeCount = json['like_count'];
    shareCount = json['share_count'];
    titlesCount = json['titles_count'];
    performance = json['Performance'];
    // performance =
    //     json['Performance'] != null ? Performance.fromJson(json['Performance']) : null;
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    sport = json['sport'] != null ? new Sports.fromJson(json['sport']) : null;
    type = json['type'] != null ? new Types.fromJson(json['type']) : null;
    position = json['position'] != null
        ? new Position.fromJson(json['position'])
        : null;
    nationality = json['nationality'] != null
        ? new Nationality.fromJson(json['nationality'])
        : null;
    if (json['taps'] != null) {
      taps = <Taps>[];
      json['taps'].forEach((v) {
        taps!.add(new Taps.fromJson(v));
      });
    }
    if (json['titles'] != null) {
      titles = <Null>[];
      json['titles'].forEach((v) {
        titles!.add(v);
      });
    }
    if (json['certificates'] != null) {
      certificates = <Null>[];
      json['certificates'].forEach((v) {
        certificates!.add(v);
      });
    }
    if (json['experiences'] != null) {
      experiences = <Null>[];
      json['experiences'].forEach((v) {
        experiences!.add(v);
      });
    }

    if (json['contacts'] != null) {
      contacts = <Null>[];
      json['contacts'].forEach((v) {
        contacts!.add(v);
      });
    }
  }
}

class Country {
  int? id;
  String? name;
  String? image;

  Country({this.id, this.name, this.image});

  Country.fromJson(Map<String, dynamic> json) {
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

class Sports {
  Null id;
  String? name;
  String? image;

  Sports({this.id, this.name, this.image});

  Sports.fromJson(Map<String, dynamic> json) {
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

class Types {
  int? id;
  String? name;
  String? image;

  Types({this.id, this.name, this.image});

  Types.fromJson(Map<String, dynamic> json) {
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

class Nationality {
  Null id;
  String? name;
  String? image;

  Nationality({this.id, this.name, this.image});

  Nationality.fromJson(Map<String, dynamic> json) {
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

class City {
  Null id;
  String? name;
  String? image;

  City({this.id, this.name, this.image});

  City.fromJson(Map<String, dynamic> json) {
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
  Null id;
  String? name;
  String? image;

  Position({this.id, this.name, this.image});

  Position.fromJson(Map<String, dynamic> json) {
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

class Taps {
  int? id;
  String? name;
  String? type;
  String? image;
  List<Sections>? sections;

  Taps({this.id, this.name, this.type, this.image, this.sections});

  Taps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sections {
  int? id;
  String? name;
  String? type;
  String? image;

  Sections({this.id, this.name, this.type, this.image});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['image'] = this.image;
    return data;
  }
}

// class Titles {
//   int? id;
//   Null? sport;
//   int? number;
//   int? leagueType;

//   Titles({this.id, this.sport, this.number, this.leagueType});

//   Titles.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     sport = json['sport'];
//     number = json['number'];
//     leagueType = json['league_type'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['sport'] = this.sport;
//     data['number'] = this.number;
//     data['league_type'] = this.leagueType;
//     return data;
//   }
// }

// class Certificates {
//   int? id;
//   String? name;
//   String? image;
//   String? date;

//   Certificates({this.id, this.name, this.image, this.date});

//   Certificates.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     date = json['date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['date'] = this.date;
//     return data;
//   }
// }

// class Experiences {
//   int? id;
//   Sportsss? sport;
//   ExPosition? position;
//   String? clubName;
//   int? leagueType;
//   String? startDate;
//   String? endDate;
//   int? type;
//   String? teamOne;
//   int? teamOneScore;
//   String? teamTwo;
//   int? teamTwoScore;
//   String? createdAt;

//   Experiences(
//       {this.id,
//       this.sport,
//       this.position,
//       this.clubName,
//       this.leagueType,
//       this.startDate,
//       this.endDate,
//       this.type,
//       this.teamOne,
//       this.teamOneScore,
//       this.teamTwo,
//       this.teamTwoScore,
//       this.createdAt});

//   Experiences.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     sport = json['sport'] != null ? new Sportsss.fromJson(json['sport']) : null;
//     position = json['position'] != null
//         ? new ExPosition.fromJson(json['position'])
//         : null;
//     clubName = json['club_name'];
//     leagueType = json['league_type'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     type = json['type'];
//     teamOne = json['team_one'];
//     teamOneScore = json['team_one_score'];
//     teamTwo = json['team_two'];
//     teamTwoScore = json['team_two_score'];
//     createdAt = json['created_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.sport != null) {
//       data['sport'] = this.sport!.toJson();
//     }
//     if (this.position != null) {
//       data['position'] = this.position!.toJson();
//     }
//     data['club_name'] = this.clubName;
//     data['league_type'] = this.leagueType;
//     data['start_date'] = this.startDate;
//     data['end_date'] = this.endDate;
//     data['type'] = this.type;
//     data['team_one'] = this.teamOne;
//     data['team_one_score'] = this.teamOneScore;
//     data['team_two'] = this.teamTwo;
//     data['team_two_score'] = this.teamTwoScore;
//     data['created_at'] = this.createdAt;
//     return data;
//   }
// }

// class Sportsss {
//   int? id;
//   String? name;
//   String? image;

//   Sportsss({this.id, this.name, this.image});

//   Sportsss.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     return data;
//   }
// }

// class ExPosition {
//   int? id;
//   String? name;

//   ExPosition({this.id, this.name});

//   ExPosition.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Performance {
//   int? id;
//   Null runTime;
//   Null verticalJumpDistance;
//   Null longJumpDistance;
//   Null liftingWeight;
//   Null liftingWeightLeg;
//   Null liftingWeightHand;
//   String? createdAt;

//   Performance(
//       {this.id,
//       this.runTime,
//       this.verticalJumpDistance,
//       this.longJumpDistance,
//       this.liftingWeight,
//       this.liftingWeightLeg,
//       this.liftingWeightHand,
//       this.createdAt});

//   Performance.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     runTime = json['runTime'];
//     verticalJumpDistance = json['verticalJump_distance'];
//     longJumpDistance = json['longJump_distance'];
//     liftingWeight = json['lifting_weight'];
//     liftingWeightLeg = json['lifting_weight_leg'];
//     liftingWeightHand = json['lifting_weight_hand'];
//     createdAt = json['created_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['runTime'] = this.runTime;
//     data['verticalJump_distance'] = this.verticalJumpDistance;
//     data['longJump_distance'] = this.longJumpDistance;
//     data['lifting_weight'] = this.liftingWeight;
//     data['lifting_weight_leg'] = this.liftingWeightLeg;
//     data['lifting_weight_hand'] = this.liftingWeightHand;
//     data['created_at'] = this.createdAt;
//     return data;
//   }
// }

// class Contacts {
//   int? id;
//   String? text;
//   String? countryCode;
//   int? type;
//   int? socialMediaType;
//   int? privacy;
//   String? createdAt;

//   Contacts(
//       {this.id,
//       this.text,
//       this.countryCode,
//       this.type,
//       this.socialMediaType,
//       this.privacy,
//       this.createdAt});

//   Contacts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     text = json['text'];
//     countryCode = json['country_code'];
//     type = json['type'];
//     socialMediaType = json['social_media_type'];
//     privacy = json['privacy'];
//     createdAt = json['created_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['text'] = this.text;
//     data['country_code'] = this.countryCode;
//     data['type'] = this.type;
//     data['social_media_type'] = this.socialMediaType;
//     data['privacy'] = this.privacy;
//     data['created_at'] = this.createdAt;
//     return data;
//   }
// }
