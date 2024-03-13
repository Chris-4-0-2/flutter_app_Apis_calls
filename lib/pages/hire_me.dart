import 'package:flutter/material.dart';

class HireMePage extends StatelessWidget {
  const HireMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  'assets/images/fotoChrisPiscina.jpg',
                ), // Reemplaza con la ruta de tu foto
              ),
              SizedBox(height: 20),
              Text(
                'Nombre:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Christopher Y. Manzueta',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Correo electrónico: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'christophermanzueta.4.0.2@gmail.com',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Teléfono:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '849-401-5923',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
