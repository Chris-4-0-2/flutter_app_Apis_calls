import 'package:flutter/material.dart';
import 'package:tarea6_flutter/api/get_api.dart';

class ApiGender extends StatefulWidget {
  const ApiGender({super.key});

  @override
  State<ApiGender> createState() => _ApiGenderState();
}

class _ApiGenderState extends State<ApiGender> {
  String name = 'juan';
  late String uri = "https://api.genderize.io/?name=$name";
  late Api api = Api(url: uri);

  void _updateName(String newName) {
    setState(() {
      name = newName;
      api = Api(url: "https://api.genderize.io/?name=$name");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
                final data =
                    snapshot.data as Map<String, dynamic>; // Cast to Map
                Color color = Colors.blue;
                final gender = data['gender'];
                if (gender == 'female') {
                  color = Colors.pink;
                }
                return Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['name'] ?? 'No data available'),
                      Text(data['gender'] ?? 'No data available')
                    ],
                  ),
                ); // Access data
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}'); // Handle errors
              }
              return const CircularProgressIndicator(); // Show loading indicator
            },
          ),
        ],
      ),
    );
  }
}
