class AddContactModel {
  Data? data;
  String? message;
  List<Null>? errors;

  AddContactModel({this.data, this.message, this.errors});

  AddContactModel.fromJson(Map<String, dynamic> json) {
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
  String? contactType;
  String? contactValue;
  String? privacy;
  int? modelId;
  String? modelType;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.contactType,
      this.contactValue,
      this.privacy,
      this.modelId,
      this.modelType,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    contactType = json['contact_type'];
    contactValue = json['contact_value'];
    privacy = json['privacy'];
    modelId = json['model_id'];
    modelType = json['model_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_type'] = this.contactType;
    data['contact_value'] = this.contactValue;
    data['privacy'] = this.privacy;
    data['model_id'] = this.modelId;
    data['model_type'] = this.modelType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
