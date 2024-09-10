class UserModel {
  final String email;
  final String displayName;
  final String id;

  UserModel({required this.email, required this.displayName, required this.id});

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        displayName = json['displayName'],
        id = json['id'];

  Map<String, dynamic> toJson() =>
      {'email': email, 'displayName': displayName, 'id': id};

  @override
  String toString() {
    return {
      '"email"': '"$email"',
      '"displayName"': '"$displayName"',
      '"id"': '"$id"',
    }.toString();
  }
}
