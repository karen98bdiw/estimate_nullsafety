class RegisterRequestModel {
  AdminRequest? adminRequest;
  ClientRequest? clientRequest;
  String? confirmPassword;
  String? email;
  String? firstname;
  GroupRequest? groupRequest;
  String? lastName;
  List<Links>? links;
  Location? location;
  String? password;
  String? phoneNumber;
  ProfileRequest? profileRequest;
  String? role;
  List<Skill>? skills;

  RegisterRequestModel(
      {this.adminRequest,
      this.clientRequest,
      this.confirmPassword,
      this.email,
      this.firstname,
      this.groupRequest,
      this.lastName,
      this.links,
      this.location,
      this.password,
      this.phoneNumber,
      this.profileRequest,
      this.role,
      this.skills});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    adminRequest = json['adminRequest'] != null
        ? new AdminRequest.fromJson(json['adminRequest'])
        : null;
    clientRequest = json['clientRequest'] != null
        ? new ClientRequest.fromJson(json['clientRequest'])
        : null;
    confirmPassword = json['confirmPassword'];
    email = json['email'];
    firstname = json['firstname'];
    groupRequest = json['groupRequest'] != null
        ? new GroupRequest.fromJson(json['groupRequest'])
        : null;
    lastName = json['lastName'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    profileRequest = json['profileRequest'] != null
        ? new ProfileRequest.fromJson(json['profileRequest'])
        : null;
    role = json['role'];
    if (json['skills'] != null) {
      skills = <Skill>[];
      json['skills'].forEach((v) {
        skills!.add(new Skill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.adminRequest != null) {
      data['adminRequest'] = this.adminRequest!.toJson();
    }
    if (this.clientRequest != null) {
      data['clientRequest'] = this.clientRequest!.toJson();
    }
    data['confirmPassword'] = this.confirmPassword;
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    if (this.groupRequest != null) {
      data['groupRequest'] = this.groupRequest!.toJson();
    }
    data['lastName'] = this.lastName;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    if (this.profileRequest != null) {
      data['profileRequest'] = this.profileRequest!.toJson();
    }
    data['role'] = this.role;
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skill {
  final String? name;

  Skill({this.name});

  Map<String, dynamic> toJson() {
    return {"name": this.name};
  }

  factory Skill.fromJson(json) => Skill(name: json["name"]);
}

class AdminRequest {
  String? adminType;
  String? id;

  AdminRequest({this.adminType, this.id});

  AdminRequest.fromJson(Map<String, dynamic> json) {
    adminType = json['adminType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adminType'] = this.adminType;
    data['id'] = this.id;
    return data;
  }
}

class ClientRequest {
  String? clientType;
  String? companyName;
  String? id;
  String? yourPosition;

  ClientRequest(
      {this.clientType, this.companyName, this.id, this.yourPosition});

  ClientRequest.fromJson(Map<String, dynamic> json) {
    clientType = json['clientType'];
    companyName = json['companyName'];
    id = json['id'];
    yourPosition = json['yourPosition'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientType'] = this.clientType;
    data['companyName'] = this.companyName;
    data['id'] = this.id;
    data['yourPosition'] = this.yourPosition;
    return data;
  }
}

class GroupRequest {
  String? groupType;
  String? id;

  GroupRequest({this.groupType, this.id});

  GroupRequest.fromJson(Map<String, dynamic> json) {
    groupType = json['groupType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupType'] = this.groupType;
    data['id'] = this.id;
    return data;
  }
}

class Links {
  String? name;

  Links({this.name});

  Links.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Location {
  String? aptSuite;
  String? city;
  String? country;
  String? id;
  String? state;
  String? streetAddress;
  String? zipCode;

  Location(
      {this.aptSuite,
      this.city,
      this.country,
      this.id,
      this.state,
      this.streetAddress,
      this.zipCode});

  Location.fromJson(Map<String, dynamic> json) {
    aptSuite = json['aptSuite'];
    city = json['city'];
    country = json['country'];
    id = json['id'];
    state = json['state'];
    streetAddress = json['streetAddress'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aptSuite'] = this.aptSuite;
    data['city'] = this.city;
    data['country'] = this.country;
    data['id'] = this.id;
    data['state'] = this.state;
    data['streetAddress'] = this.streetAddress;
    data['zipCode'] = this.zipCode;
    return data;
  }
}

class ProfileRequest {
  String? id;
  List<String>? professionsId;
  String? profileType;
  String? seniorityId;
  String? workTimeType;

  ProfileRequest(
      {this.id,
      this.professionsId,
      this.profileType,
      this.seniorityId,
      this.workTimeType});

  ProfileRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionsId = json['professionsId'].cast<String>();
    profileType = json['profileType'];
    seniorityId = json['seniorityId'];
    workTimeType = json['workTimeType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['professionsId'] = this.professionsId;
    data['profileType'] = this.profileType;
    data['seniorityId'] = this.seniorityId;
    data['workTimeType'] = this.workTimeType;
    return data;
  }
}
