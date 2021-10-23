import 'package:pupaadmin/modules/auth/domain/entities/session_entity.dart';

class SessionModel extends SessionEntity {
  SessionModel({
    required String name,
    required String lastname,
    required String username,
    required String sessId,
    required String uid,
    String? secondName,
    String? secondLastname,
  }) : super(
          sessId: sessId,
          uid: uid,
          name: name,
          lastname: lastname,
          username: username,
          secondName: secondName,
          secondLastname: secondLastname,
        );

  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        name: json['name'],
        lastname: json['lastname'],
        username: json['username'],
        sessId: json['sessId'],
        uid: json['uid'],
        secondName: json['secondName'],
        secondLastname: json['secondLastname'],
      );

  Map<String, dynamic> toMap() => {
        "sessId": sessId,
        "uid": uid,
        "name": name,
        "lastname": lastname,
        "username": username,
        "secondName": secondName,
        "secondLastname": secondLastname,
      };
}
