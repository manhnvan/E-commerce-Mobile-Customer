import 'package:flutter/cupertino.dart';

class User extends ChangeNotifier {
  String id, name, firstName, lastName, email, accessToken, idToken, loginType;
  dynamic picture;
  bool loggedIn = false;

  User();

  void setUser(String id, String name, String token, String loginType, {dynamic picture, String email, String idToken}) {
    this.id = id;
    this.name = name;
    this.accessToken = token;
    this.loginType = loginType;
    if (picture != null) {
      this.picture = picture;
    }
    if (email != null) {
      this.email = email;
    }

    if (idToken != null) {
      this.idToken = idToken;
    }
    this.loggedIn = true;
    notifyListeners();
  }

  Map<String, dynamic> getUser() {
    return {
      'name': this.name,
      'id': this.id,
      'loginType': this.loginType,
      'accessToken': this.accessToken,
      'idToken': this.idToken,
      'picture': this.picture,
    };
  }
}