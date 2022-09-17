class AddSkillsModel {
  Data? data;
  String? message;
  List<Null>? errors;

  AddSkillsModel({this.data, this.message, this.errors});

  AddSkillsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    
    
  }
}

class Data {
  String? title;
  String? isFreestyle;
  String? videoName;
  int? modelId;
  String? modelType;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.title,
      this.isFreestyle,
      this.videoName,
      this.modelId,
      this.modelType,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isFreestyle = json['is_freestyle'];
    videoName = json['video_name'];
    modelId = json['model_id'];
    modelType = json['model_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['is_freestyle'] = this.isFreestyle;
    data['video_name'] = this.videoName;
    data['model_id'] = this.modelId;
    data['model_type'] = this.modelType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
