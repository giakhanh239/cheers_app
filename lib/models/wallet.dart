class Wallet {
  String? address;
  String? message;
  String? signature;

  Wallet({this.address, this.message, this.signature});

  Wallet.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    message = json['message'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['message'] = this.message;
    data['signature'] = this.signature;
    return data;
  }
}