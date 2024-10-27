class loginResponceModel {
  String? status;
  String? message;
  User? user;
  String? token;

  loginResponceModel({this.status, this.message, this.user, this.token});

  loginResponceModel.fromJson(Map<String, dynamic> json) {
    print(json);
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? fatherName;
  String? phone;
  String? address;
  String? email;
  String? emailVerifiedAt;
  String? role;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.fatherName,
        this.phone,
        this.address,
        this.email,
        this.emailVerifiedAt,
        this.role,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fatherName = json['father_name'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['father_name'] = this.fatherName;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role'] = this.role;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
