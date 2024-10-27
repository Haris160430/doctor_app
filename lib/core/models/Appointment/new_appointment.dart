class NewAppointmentModel {
  int? id;
  int? userId;
  int? serviceId;
  String? servicedis;
  String? date;
  String? time;
  String? status;
  String? createdAt;
  String? updatedAt;

  NewAppointmentModel(
      {this.id,
        this.userId,
        this.serviceId,
        this.date,
        this.servicedis,
        this.time,
        this.status,
        this.createdAt,
        this.updatedAt});

  NewAppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['service_id'] = this.serviceId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
