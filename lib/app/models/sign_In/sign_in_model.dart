import 'package:task_next_x/app/models/sign_In/sign_in_data_model.dart';

class SignInModel {
  String? status;
  SignInDataModel? signInData;
  String? token;

  SignInModel({this.status, this.signInData, this.token});

  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    signInData =
    json['data'] != null ? SignInDataModel.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (signInData != null) {
      data['data'] = signInData!.toJson();
    }
    data['token'] = token;
    return data;
  }
}
