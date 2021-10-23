import 'package:pupaadmin/core/entities/user_interface.dart';

class SessionEntity extends UserInterface {
  final String sessId;
  final String uid;

  SessionEntity({
    required this.sessId,
    required this.uid,
    required String name,
    required String lastname,
    required String username,
    String? secondLastname,
    String? secondName,
  }) : super(
          name: name,
          lastname: lastname,
          username: username,
          secondName: secondName,
          secondLastname: secondLastname,
        );
}
