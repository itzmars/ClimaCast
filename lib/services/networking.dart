import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = response.body;
    
      var decodeData = jsonDecode(data);

      return decodeData;
    } else {
      print('no data iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
      print(response.statusCode);
    }
  }
}
