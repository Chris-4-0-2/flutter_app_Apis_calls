import 'package:flutter/material.dart';
import 'package:tarea6_flutter/api/get_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiWeather extends StatelessWidget {
  late final token = dotenv.env['OPENWEATHERMAP_TOKEN'];
  late final api = Api(
      url:
          "https://api.openweathermap.org/data/2.5/weather?q=Dominican+Republic&APPID=$token&units=metric&lang=es");
  ApiWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: api.getResponse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data as Map<String, dynamic>;
            String temperature = "${data['main']['temp']}";
            String humidity = "${data['main']['humidity']}";
            String conditions = data['weather'][0]['description'];
            String location = data['name'];
            String windSpeed = data['wind']['speed'].toString();
            String pressure = data['main']['pressure'].toString();

            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(36.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[50], // Light blue background
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Date and Time (assuming you have this data)
                      Text(
                        DateTime.now().toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      // Location
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Temperature and Feels Like
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$temperature°C',
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Feels like: $temperature°C',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      // Conditions
                      Text(
                        conditions,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      // Additional Information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoRow('Wind', '$windSpeed m/s'),
                          _buildInfoRow('Pressure', '$pressure hPa'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoRow('Humidity', '$humidity%'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
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

Widget _buildInfoRow(String label, String value) {
  return Row(
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.grey,
        ),
      ),
      const SizedBox(width: 5.0),
      Text(
        value,
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
    ],
  );
}
