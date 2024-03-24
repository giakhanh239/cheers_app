class User {
  int? id;
  String? name;
  String? avatar;
  String? walletAddress;
  String? email;
  String? role;

  User(
      {this.id,
        this.name,
        this.avatar,
        this.walletAddress,
        this.email,
        this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    walletAddress = json['walletAddress'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['walletAddress'] = this.walletAddress;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}


