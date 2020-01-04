class User {
  String name;
  String login;
  String password;

  User({this.name, this.login, this.password});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    login = json['login'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['login'] = this.login;
    data['password'] = this.password;
    return data;
  }
}
