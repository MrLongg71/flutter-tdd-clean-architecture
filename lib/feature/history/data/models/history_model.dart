import '../../domain/entities/history.dart';

class HistoryModel extends History {
  HistoryModel({String? id, String? userId, String? title, String? body})
      : super(id: id, userId: userId, title: title, body: body);
  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        body: json['body'],
      );

  //@TODO toJson
}
