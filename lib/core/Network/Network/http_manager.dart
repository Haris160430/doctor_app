// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:convert';
import 'dart:developer';
import 'package:mardanorthodonticcenter/core/Network/Network/response_handler.dart';
import '../../models/Appointment/new_appointment.dart';
import '../../models/login_dto/login_request_model.dart';
import '../../models/login_dto/respone_model.dart';
import '../../models/services_model/services_model.dart';
import 'api_urls.dart';

class HTTPManager {
  final ResponseHandler _handler = ResponseHandler();
  // login api
  Future<loginResponceModel> loginUser(LoginRequestModel loginRequestModel) async {
    var url = ApplicationURLs.login;
    log(url);

    final response = await _handler.postWithJsonRequest(Uri.parse(url), loginRequestModel.toJson());
    print(response);
    loginResponceModel logInResponseModel = loginResponceModel.fromJson(response);
     return logInResponseModel;
  }
//   logout api
  Future<dynamic> logout() async {
    var url = ApplicationURLs.logout;
    log(url);

    final response = await _handler.postWithToken(Uri.parse(url),{});

    return response;
  }

  // getPatientServices api
  Future<ServicesModel> getPatientServices() async {
    var url = ApplicationURLs.patientservices;
    log(url);

    var  response = await _handler.getWithToken(Uri.parse(url));
    log(response.toString());

    
    ServicesModel services = ServicesModel.fromJson(response);


    return services;
  }


  Future<List<NewAppointmentModel>> GetPatientAppointment() async {
    var url = ApplicationURLs.createpatientappointments;
    log(url);

    var  response = await _handler.getWithToken(Uri.parse(url));
    log(response.toString());

    List<NewAppointmentModel> data = [];
    response.forEach((value){
      data.add( NewAppointmentModel.fromJson(value));
    });



    return data;
  }


}

