class TaskCountByStatusModel {
  String? sId;
  int? sum;

  TaskCountByStatusModel({this.sId, this.sum});

  TaskCountByStatusModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sum = json['sum'];
  }
}
