class AddExprienceModel {
  Data? data;
  String? message;
  List<Null>? errors;

  AddExprienceModel({this.data, this.message, this.errors});

  AddExprienceModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['errors'] != null) {
      json['errors'].forEach((v) {
        errors!.add((v));
      });
    }
  }


}

class Data {
  String? clubName;
  String? startingDate;
  String? endingDate;
  int? modelId;
  String? modelType;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.clubName,
      this.startingDate,
      this.endingDate,
      this.modelId,
      this.modelType,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    clubName = json['club_name'];
    startingDate = json['starting_date'];
    endingDate = json['ending_date'];
    modelId = json['model_id'];
    modelType = json['model_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
