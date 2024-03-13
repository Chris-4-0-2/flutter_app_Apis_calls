import 'package:flutter/material.dart';
import 'package:tarea6_flutter/api/get_api.dart';

class ApiYearsOld extends StatefulWidget {
  const ApiYearsOld({super.key});

  @override
  State<ApiYearsOld> createState() => _ApiYearsOldState();
}

class _ApiYearsOldState extends State<ApiYearsOld> {
  final images = [
    "assets/images/adultoImage.webp",
    "assets/images/ancianoImage.webp",
    "assets/images/jovenImage.webp"
  ];

  late String currentImage = images[2];

  String name = 'juan';
  late String uri = "https://api.agify.io/?name=$name";
  late Api api = Api(url: uri);

  void _updateName(String newName) {
    setState(() {
      name = newName;
      api = Api(url: "https://api.agify.io/?name=$name");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            onChanged: _updateName,
            decoration: const InputDecoration(labelText: 'Enter a name'),
          ),
        ),
        FutureBuilder(
          future: api.getResponse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data as Map<String, dynamic>; // Cast to Map
              final edad = data['age'] ?? 0;
              if (edad < 18) {
                currentImage = images[0];
              } else if (edad < 65) {
                currentImage = images[1];
              }
              return Center(
                child: Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['name'] ?? 'No data available'),
                      Text(data['age'].toString()),
                    ],
                  ),
                ),
              ); // Access data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Handle errors
            }
            return const CircularProgressIndicator(); // Show loading indicator
          },
        ),
        SizedBox(
            width: 75,
            height: 100,
            child: Image.asset(
              currentImage,
            )),
      ],
    );
  }
}
