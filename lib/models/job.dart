import 'package:freelance/models/bid.dart';
import 'package:freelance/models/user.dart';

class Job {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  int? price;
  String? status;
  User? owner;
  List<Bid>? bids;

  Job(
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.price,
      this.status,
      this.owner,
      this.bids});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    status = json['status'];
    owner = json['owner'] != null ? new User.fromJson(json['owner']) : null;
    if (json['bids'] != null) {
      bids = <Bid>[];
      json['bids'].forEach((v) {
        bids!.add(new Bid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['status'] = this.status;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    return data;
  }
}
