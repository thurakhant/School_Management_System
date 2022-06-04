class User {
  late String id;
  late String name;
  late String family;
  late String mobile;
  late String? email;
  late bool admin;
  late int type;
  late String? token;
  late bool active;
  late String? lastlogin;

  User({
    required this.id,
    required this.name,
    required this.family,
    required this.mobile,
    this.email,
    required this.admin,
    required this.type,
    this.token,
    required this.active,
    this.lastlogin,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    family = json['family'];
    mobile = json['mobile'];
    email = json['email'];
    admin = json['admin'];
    type = json['type'];
    token = json['token'];
    active = json['active'] == 1;
    lastlogin = json['lastlogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['family'] = family;
    data['mobile'] = mobile;
    data['email'] = email;
    data['admin'] = admin;
    data['type'] = type;
    data['token'] = token;
    data['active'] = active ? 1 : 0;
    data['lastlogin'] = lastlogin;
    return data;
  }

  String get typeName => type == 1
      ? 'Admin'
      : type == 2
          ? 'Teacher'
          : 'Student';
}
