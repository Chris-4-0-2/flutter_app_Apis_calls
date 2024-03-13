import 'package:flutter/material.dart';
import 'package:tarea6_flutter/api/get_api.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ApiWorpressWeb extends StatelessWidget {
  final api = Api(url: "https://www.curistoria.com/wp-json/wp/v2/posts");
  ApiWorpressWeb({super.key});

  String removeHtmlTags(String htmlText) {
    // Regular expression to match HTML tags
    final regex1 = RegExp(r"<[^>]*>|");
    final regex2 = RegExp(r"\[&hellip;]");

    // Replace all HTML tags with an empty string
    String text = htmlText.replaceAll(regex1, "");
    return text.replaceAll(regex2, "...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: api.getResponse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as List;
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index]['title']['rendered'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      removeHtmlTags(data[index]['excerpt']['rendered']),
                    ),
                    ElevatedButton( 
                      child: Text(
                        data[index]['link'],
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () => _launchURL(data[index]['link']),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'No se pudo abrir la URL: $url';
  }
}

