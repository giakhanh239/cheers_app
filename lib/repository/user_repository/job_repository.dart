import 'package:freelance/models/bid.dart';
import 'package:freelance/models/job.dart';
import 'package:freelance/service/api/api_path.dart';
import 'package:freelance/service/api/api_service.dart';
import 'package:freelance/service/shared_data/storage_service.dart';
import 'package:dio/dio.dart';

class JobRepository {
  static Future<List<Job>> getJobs() async {
    final response = await ApiService().get(ApiPath.getJobs);
    final data = response.data;
    List<Job> jobs = [];
    if (data != null) {
      data.forEach((v) {
        jobs.add(Job.fromJson(v));
      });
    }
    return jobs;
  }

  static Future<dynamic> sendBids(Bid? bid) async {
    final response = await ApiService().post(ApiPath.bid, data: bid?.toJson());
    final data = response.data;
    return data;
  }

  static Future<dynamic> buy() async {
    final address = StorageService().address;
    final data = {
      'network': 'devnet',
      'wallet': address,
      'name': 'MTP',
      'symbol': 'MTP',
      'description': 'Hay trao cho anh MV',
      'decimals': '0',
      'receiver': address
    };
    final response = await ApiService()
        .post('https://api.shyft.to/sol/v1/token/create_detach',
            data: data,
            options: Options(
              headers: {
                "x-api-key": "-3iYNcRok7Gm4EMl",
              },
            ));

    return response.data;
  }

  static Future<dynamic> createJob(Job job) async {
    final response =
        await ApiService().post(ApiPath.createJob, data: job.toJson());
    final data = response.data;
    return data;
  }

  static Future<Job> detailJob(Job? job) async {
    final response = await ApiService().get(ApiPath.detailJob(job?.id ?? 0));
    final data = response.data;
    return Job.fromJson(data);
  }

  static Future<dynamic> acceptBid(Bid? bid) async {
    final response = await ApiService().post(ApiPath.acceptBid(bid?.id ?? 0));
    final data = response.data;
    return data;
  }
}
