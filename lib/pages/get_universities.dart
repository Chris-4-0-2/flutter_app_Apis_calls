import 'package:flutter/material.dart';
import 'package:tarea6_flutter/api/get_api.dart';

class ApiUniversities extends StatefulWidget {
  const ApiUniversities({super.key});

  @override
  State<ApiUniversities> createState() => _ApiUniversitiesState();
}

class _ApiUniversitiesState extends State<ApiUniversities> {
  String country = 'Dominican republic';
  late Api api =
      Api(url: 'http://universities.hipolabs.com/search?country=$country');

  void _updateCountry(String countryName) {
    setState(() {
      country = countryName.replaceAll(" ", "+");
      api =
          Api(url: 'http://universities.hipolabs.com/search?country=$country');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              country,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: 250,
              child: TextField(
                onChanged: _updateCountry,
                decoration:
                    const InputDecoration(labelText: 'Enter a country name'),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: api.getResponse(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List; // Cast to Map
                  return Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.circular(30)),
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(data[index]['name'] +
                                      " (${data[index]['domains'][0]})"),
                                  subtitle: Text(data[index]['web_pages'][0]),
                                  leading: const Icon(Icons.house_siding_sharp),
                                ))),
                  ); // Access data
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // Handle errors
                }
                return const Text("Cargando..."); // Show loading indicator
              },
            ),
          ),
        ],
      ),
    );
  }
}