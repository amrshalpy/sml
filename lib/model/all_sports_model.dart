class GetAllSports {
  List<Data> data=[];
  String? message;
  List<Null>? errors;

  // GetAllSports({this.data, this.message, this.errors});

  GetAllSports.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Null>[];
      
    }
  }

 
}

class Data {
  int? id;
  String? name;
  int? sportId;
  int? numberOfUsers;
  String? createdAt;
  String? updatedAt;
  int? isUserAdd;
  List<Sports> sports=[];

  
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    numberOfUsers = json['number_of_users'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isUserAdd = json['is_user_add'];
    if (json['sports'] != null) {
      sports = <Sports>[];
      json['sports'].forEach((v) {
        sports.add(new Sports.fromJson(v));
      });
    }
  }

  
}

class Sports {
  int? id;
  String? name;
  int? sportId;
  int? numberOfUsers;
  String? createdAt;
  String? updatedAt;
  int? isUserAdd;
  List<Null>? sports;

  
  Sports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    numberOfUsers = json['number_of_users'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isUserAdd = json['is_user_add'];
    // if (json['sports'] != null) {
     
    //   json['sports'].forEach((v) {
    //     sports!.add( Null.fromJson(v));
      // });
    }
  }

 

class GetSports {
  List<AllData> data=[];
  String? message;
  List<Null>? errors;

  // GetSports({this.data, this.message, this.errors});

  GetSports.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add( AllData.fromJson(v));
      });
    }
    message = json['message'];
    
    }
  }

  


class AllData {
  int? id;
  String? name;
  int? sportId;
  int? numberOfUsers;
  String? createdAt;
  String? updatedAt;
  int? isUserAdd;
  List<MainSports> sports=[];

  
  AllData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    numberOfUsers = json['number_of_users'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isUserAdd = json['is_user_add'];
    if (json['sports'] != null) {
      json['sports'].forEach((v) {
        sports.add( MainSports.fromJson(v));
      });
    }
  }

 
}

class MainSports {
  int? id;
  String? name;
  int? sportId;
  int? numberOfUsers;
  String? createdAt;
  String? updatedAt;
  int? isUserAdd;
  List<Null>? sports;

  
  MainSports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sportId = json['sport_id'];
    numberOfUsers = json['number_of_users'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isUserAdd = json['is_user_add'];
    // if (json['sports'] != null) {
    //   sports = <Null>[];
    //   json['sports'].forEach((v) {
    //     sports!.add(new Null.fromJson(v));
    //   });
    }
  }

 
 

