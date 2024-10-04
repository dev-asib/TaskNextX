import 'package:task_next_x/app/models/sign_up/sign_up_data_model.dart';

class SignUpModel {
  String? status;
  SignUpDataModel? signUpData;

  SignUpModel({this.status, this.signUpData});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    signUpData = json['data'] != null ? SignUpDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (signUpData != null) {
      data['data'] = signUpData!.toJson();
    }
    return data;
  }
}

