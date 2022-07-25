class LoginModel {
  Token? token;
  User? user;

  LoginModel({this.token, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Token {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Token({this.accessToken, this.tokenType, this.expiresIn});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? countryCode;
  String? photo;
  int? numberOfViews;
  int? numberOfLikes;
  int? numberOfShares;
  String? qrCodeImage;
  int? balance;
  String? createdAt;
  String? updatedAt;
  int? accountTypeId;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.countryCode,
      this.photo,
      this.numberOfViews,
      this.numberOfLikes,
      this.numberOfShares,
      this.qrCodeImage,
      this.balance,
      this.createdAt,
      this.updatedAt,
      this.accountTypeId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    countryCode = json['country_code'];
    photo = json['photo'];
    numberOfViews = json['number_of_views'];
    numberOfLikes = json['number_of_likes'];
    numberOfShares = json['number_of_shares'];
    qrCodeImage = json['qr_code_image'];
    balance = json['balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accountTypeId = json['account_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['country_code'] = this.countryCode;
    data['photo'] = this.photo;
    data['number_of_views'] = this.numberOfViews;
    data['number_of_likes'] = this.numberOfLikes;
    data['number_of_shares'] = this.numberOfShares;
    data['qr_code_image'] = this.qrCodeImage;
    data['balance'] = this.balance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['account_type_id'] = this.accountTypeId;
    return data;
  }
}