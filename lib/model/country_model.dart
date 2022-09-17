import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
    CountryModel({
        this.data,
        this.message,
        this.errors,
    });

    List<Datum> ?data;
    String? message;
    List<dynamic>? errors;

    factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "errors": List<dynamic>.from(errors!.map((x) => x)),
    };
}

class Datum {
    Datum({
        this.code,
        this.name,
        this.phoneCode,
    });

    String? code;
    String ?name;
    String? phoneCode;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        code: json["code"],
        name: json["name"],
        phoneCode: json["phone_code"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "phone_code": phoneCode,
    };
}
