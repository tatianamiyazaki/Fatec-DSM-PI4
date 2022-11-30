class User {
  String? name;
  String? mail;
  String? password;
  String? keepOn;

  User({required this.name, required this.mail, required this.password, required this.keepOn});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mail = json['mail'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mail'] = this.mail;
    data['password'] = this.password;
    data['keepOn'] = this.keepOn;
    return data;
  }

  String toString(){
    return "Name: " +
      name! +
      "\nE-mail: " +
      mail! +
      "\nPassword: " +
      password!;
  }
}