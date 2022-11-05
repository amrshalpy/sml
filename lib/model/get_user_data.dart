class GetUserDataModel {
  String? message;
  Data? data;
  int? status;

  GetUserDataModel({this.message, this.data, this.status});

  GetUserDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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
  List<Titles>? titles;
  List<Certificates>? certificates;
  List<Experiences>? experiences;
  Performance? performance;
  List<Contacts>? contacts;

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
    performance = json['Performance'] != null
        ? Performance.fromJson(json['Performance'])
        : null;
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    sport = json['sport'] != null ? Sports.fromJson(json['sport']) : null;
    type = json['type'] != null ? Types.fromJson(json['type']) : null;
    position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    nationality = json['nationality'] != null
        ? Nationality.fromJson(json['nationality'])
        : null;
    if (json['taps'] != null) {
      taps = <Taps>[];
      json['taps'].forEach((v) {
        taps!.add(Taps.fromJson(v));
      });
    }
    if (json['titles'] != null) {
      titles = <Titles>[];
      json['titles'].forEach((v) {
        titles!.add(Titles.fromJson(v));
      });
    }
    if (json['certificates'] != null) {
      certificates = <Certificates>[];
      json['certificates'].forEach((v) {
        certificates!.add(Certificates.fromJson(v));
      });
    }
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(Experiences.fromJson(v));
      });
    }

    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(Contacts.fromJson(v));
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class City {
  int? id;
  String? name;
  String? image;

  City({this.id, this.name, this.image});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Nationality {
  int? id;
  String? name;
  String? image;

  Nationality({this.id, this.name, this.image});

  Nationality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}

class Sports {
  int? id;
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

class Sportssss {
  int? id;
  String? name;
  String? image;

  Sportssss({this.id, this.name, this.image});

  Sportssss.fromJson(Map<String, dynamic> json) {
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
  String? image;

  Position({this.id, this.name, this.image});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
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
}

class Titles {
  int? id;
  Sportssss? sport;
  int? number;
  int? leagueType;

  Titles({this.id, this.sport, this.number, this.leagueType});

  Titles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sport = json['sport'] != null ? Sportssss.fromJson(json['sport']) : null;
    number = json['number'];
    leagueType = json['league_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sport'] = this.sport;
    data['number'] = this.number;
    data['league_type'] = this.leagueType;
    return data;
  }
}

class Certificates {
  int? id;
  String? name;
  String? image;
  String? date;

  Certificates({this.id, this.name, this.image, this.date});

  Certificates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    date = json['date'];
  }
}

class Experiences {
  int? id;
  Sportsss? sport;
  ExperiencePosition? position;
  String? clubName;
  int? leagueType;
  String? startDate;
  String? endDate;
  int? type;
  String? teamOne;
  int? teamOneScore;
  String? teamTwo;
  int? teamTwoScore;
  String? createdAt;

  Experiences(
      {this.id,
      this.sport,
      this.position,
      this.clubName,
      this.leagueType,
      this.startDate,
      this.endDate,
      this.type,
      this.teamOne,
      this.teamOneScore,
      this.teamTwo,
      this.teamTwoScore,
      this.createdAt});

  Experiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sport = json['sport'] != null ? new Sportsss.fromJson(json['sport']) : null;
    position = json['position'] != null
        ? new ExperiencePosition.fromJson(json['position'])
        : null;
    clubName = json['club_name'];
    leagueType = json['league_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    type = json['type'];
    teamOne = json['team_one'];
    teamOneScore = json['team_one_score'];
    teamTwo = json['team_two'];
    teamTwoScore = json['team_two_score'];
    createdAt = json['created_at'];
  }
}

class Sportsss {
  int? id;
  String? name;
  String? image;

  Sportsss({this.id, this.name, this.image});

  Sportsss.fromJson(Map<String, dynamic> json) {
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

class ExperiencePosition {
  int? id;
  String? name;

  ExperiencePosition({this.id, this.name});

  ExperiencePosition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Performance {
  Null id;
  Null runTime;
  String? right;
  Null verticalJumpDistance;
  Null longJumpDistance;
  Null liftingWeight;
  Null liftingWeightLeg;
  Null liftingWeightHand;
  String? createdAt;

  Performance(
      {this.id,
      this.right,
      this.runTime,
      this.verticalJumpDistance,
      this.longJumpDistance,
      this.liftingWeight,
      this.liftingWeightLeg,
      this.liftingWeightHand,
      this.createdAt});

  Performance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    right = json['right_left'];
    runTime = json['runTime'];
    verticalJumpDistance = json['verticalJump_distance'];
    longJumpDistance = json['longJump_distance'];
    liftingWeight = json['lifting_weight'];
    liftingWeightLeg = json['lifting_weight_leg'];
    liftingWeightHand = json['lifting_weight_hand'];
    createdAt = json['created_at'];
  }
}

class Contacts {
  int? id;
  String? text;
  String? countryCode;
  int? type;
  int? socialMediaType;
  int? privacy;
  String? createdAt;

  Contacts(
      {this.id,
      this.text,
      this.countryCode,
      this.type,
      this.socialMediaType,
      this.privacy,
      this.createdAt});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    countryCode = json['country_code'];
    type = json['type'];
    socialMediaType = json['social_media_type'];
    privacy = json['privacy'];
    createdAt = json['created_at'];
  }
}
