import 'dart:convert';
import 'package:http/http.dart' as http;


class Api {
  final String url;

  Api({required this.url});

  Future getResponse() async {
    final respuesta = await http.get(Uri.parse(url));

    if (respuesta.statusCode == 200) {
      final body = json.decode(respuesta.body);
      return body;
    } else {
      return {'err': 'llamadada erronea'};
    }
  }
}