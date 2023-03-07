import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:video_reels_app/model_class.dart';

class RequestClass{
  Future<DetailModelClass> fetchData() async {

    final response = await http.get(Uri.parse('http://kampd-assignment.s3-website-ap-southeast-1.amazonaws.com/'));

    if (response.statusCode == 200) {
      return DetailModelClass.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error fetching data');
    }
  }
}