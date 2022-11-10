class AddCertificateModel {
  String? message;
  Data? data;
  int? status;

  AddCertificateModel({this.message, this.data, this.status});

  AddCertificateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  Null id;
  String? name;
  String? phone;
  String? email;
  String? image;
  String? clubName;
  String? clubLogo;
  String? gender;
  Null height;
  Null weight;
  String? manager;
  String? stadium;
  String? founder;
  String? owner;
  String? founded;
  String? birthDate;
  String? companyLocation;
  Null companyType;
  String? website;
  Null viewCount;
  Null likeCount;
  Null shareCount;
  Null titlesCount;
  Country? country;
  City? city;
  Tsports? sport;
  Country? type;
  Position? position;
  Nationality? nationality;
  List<Taps>? taps;
  List<Titles>? titles;
  List<Certificates>? certificates;
  List<Experiences>? experiences;
  List<Performance>? performance;
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
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    sport = json['sport'] != null ? new Tsports.fromJson(json['sport']) : null;
    type = json['type'] != null ? new Country.fromJson(json['type']) : null;
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
      titles = <Titles>[];
      json['titles'].forEach((v) {
        titles!.add(new Titles.fromJson(v));
      });
    }
    if (json['certificates'] != null) {
      certificates = <Certificates>[];
      json['certificates'].forEach((v) {
        certificates!.add(new Certificates.fromJson(v));
      });
    }
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(new Experiences.fromJson(v));
      });
    }
    if (json['Performance'] != null) {
      performance = <Performance>[];
      json['Performance'].forEach((v) {
        performance!.add(new Performance.fromJson(v));
      });
    }
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    data['club_name'] = this.clubName;
    data['club_logo'] = this.clubLogo;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['manager'] = this.manager;
    data['stadium'] = this.stadium;
    data['founder'] = this.founder;
    data['owner'] = this.owner;
    data['founded'] = this.founded;
    data['birth_date'] = this.birthDate;
    data['company_location'] = this.companyLocation;
    data['company_type'] = this.companyType;
    data['website'] = this.website;
    data['view_count'] = this.viewCount;
    data['like_count'] = this.likeCount;
    data['share_count'] = this.shareCount;
    data['titles_count'] = this.titlesCount;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    if (this.nationality != null) {
      data['nationality'] = this.nationality!.toJson();
    }
    if (this.taps != null) {
      data['taps'] = this.taps!.map((v) => v.toJson()).toList();
    }
    if (this.titles != null) {
      data['titles'] = this.titles!.map((v) => v.toJson()).toList();
    }
    if (this.certificates != null) {
      data['certificates'] = this.certificates!.map((v) => v.toJson()).toList();
    }
    if (this.experiences != null) {
      data['experiences'] = this.experiences!.map((v) => v.toJson()).toList();
    }
    if (this.performance != null) {
      data['Performance'] = this.performance!.map((v) => v.toJson()).toList();
    }
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  Null id;
  String? name;
  Null? image;

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

class Tsports {
  int? id;
  String? name;
  Null? image;

  Tsports({this.id, this.name, this.image});

  Tsports.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  Null? image;

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

class Nationality {
  int? id;
  String? name;
  Null? image;

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

class Titles {
  int? id;
  Position? sport;
  Null number;
  Null leagueType;

  Titles({this.id, this.sport, this.number, this.leagueType});

  Titles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sport = json['sport'] != null ? new Position.fromJson(json['sport']) : null;
    number = json['number'];
    leagueType = json['league_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date'] = this.date;
    return data;
  }
}

class Experiences {
  int? id;
  Sports? sport;
  ExPosition? position;
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
    sport = json['sport'] != null ? new Sports.fromJson(json['sport']) : null;
    position = json['position'] != null
        ? new ExPosition.fromJson(json['position'])
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sport != null) {
      data['sport'] = this.sport!.toJson();
    }
    if (this.position != null) {
      data['position'] = this.position!.toJson();
    }
    data['club_name'] = this.clubName;
    data['league_type'] = this.leagueType;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['type'] = this.type;
    data['team_one'] = this.teamOne;
    data['team_one_score'] = this.teamOneScore;
    data['team_two'] = this.teamTwo;
    data['team_two_score'] = this.teamTwoScore;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class ExPosition {
  int? id;
  String? name;

  ExPosition({this.id, this.name});

  ExPosition.fromJson(Map<String, dynamic> json) {
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

class Sports {
  int? id;
  String? name;
  String? image;

  Sports({this.id, this.name,this.image});

  Sports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Performance {
  int? id;
  int? runTime;
  int? verticalJumpDistance;
  int? longJumpDistance;
  int? liftingWeight;
  int? liftingWeightLeg;
  int? liftingWeightHand;
  String? createdAt;

  Performance(
      {this.id,
      this.runTime,
      this.verticalJumpDistance,
      this.longJumpDistance,
      this.liftingWeight,
      this.liftingWeightLeg,
      this.liftingWeightHand,
      this.createdAt});

  Performance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    runTime = json['runTime'];
    verticalJumpDistance = json['verticalJump_distance'];
    longJumpDistance = json['longJump_distance'];
    liftingWeight = json['lifting_weight'];
    liftingWeightLeg = json['lifting_weight_leg'];
    liftingWeightHand = json['lifting_weight_hand'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['runTime'] = this.runTime;
    data['verticalJump_distance'] = this.verticalJumpDistance;
    data['longJump_distance'] = this.longJumpDistance;
    data['lifting_weight'] = this.liftingWeight;
    data['lifting_weight_leg'] = this.liftingWeightLeg;
    data['lifting_weight_hand'] = this.liftingWeightHand;
    data['created_at'] = this.createdAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['country_code'] = this.countryCode;
    data['type'] = this.type;
    data['social_media_type'] = this.socialMediaType;
    data['privacy'] = this.privacy;
    data['created_at'] = this.createdAt;
    return data;
  }
}