import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetWorker {
  String url = "";
  Future getQuestions() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }
  }
}
