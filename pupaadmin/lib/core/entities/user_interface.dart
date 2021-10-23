abstract class UserInterface {
  final String username;
  String name;
  String lastname;
  String? secondName;
  String? secondLastname;

  UserInterface({
    required this.username,
    required this.name,
    required this.lastname,
    this.secondName,
    this.secondLastname,
  });
}
