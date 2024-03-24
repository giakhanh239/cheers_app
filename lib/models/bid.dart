import 'package:freelance/models/job.dart';

class Bid {
  Job? job;
  String? proposal;
  int? id;

  Bid({this.job, this.proposal});

  Bid.fromJson(Map<String, dynamic> json) {
    job = json['jobId'] != null ? Job(id: json['jobId']) : null;
    proposal = json['proposal'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobId'] = this.job?.id;
    data['proposal'] = this.proposal;
    return data;
  }
}
