import 'package:pupaadmin/interfaces/data_model_interface.dart';

class User extends DataModelInterface {
  @override
  final String id;
  final String username;
  String lastname;
  String name;
  String? secondName;
  String? secondLastname;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        lastname = json['lastname'],
        name = json['name'],
        secondName = json['secondName'],
        secondLastname = json['secondLastname'];
}
