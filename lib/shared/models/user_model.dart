import 'dart:convert';

class userModel {
  final String name;
  final String? photoURL;

  userModel({required this.name, required this.photoURL});

  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(name: map['name'], photoURL: map['photoURL']);
  }

  factory userModel.fromJson(String json) =>
      userModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "name": name,
        "photoURL": photoURL,
      };

  String toJSon() => jsonEncode(toMap());
}
