import 'package:flutter/material.dart';
import 'package:tarea6_flutter/pages/get_gender.dart';
import 'package:tarea6_flutter/pages/get_years_old.dart';
import 'package:tarea6_flutter/pages/hire_me.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int _selectedPage = 0;

  final List _pages = [
    const ApiGender(),
    const ApiYearsOld(),
    const HireMePage()
  ];
  void onTapBottomBar(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _pages[_selectedPage],
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(child: Text("logo")),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, '/homePage')
                },
              ),
              ListTile(
                leading: const Icon(Icons.home_filled),
                title: const Text("Universities"),
                onTap: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, '/universities')
                },
              ),
              ListTile(
                  leading: const Icon(Icons.storm_rounded),
                  title: const Text("Weather"),
                  onTap: () => {
                        Navigator.pop(context),
                        Navigator.pushNamed(context, '/forecast')
                      }),
              ListTile(
                  leading: const Icon(Icons.web),
                  title: const Text("Worpress"),
                  onTap: () => {
                        Navigator.pop(context),
                        Navigator.pushNamed(context, '/worpressInfo')
                      })
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: onTapBottomBar,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.boy), label: "Gender"),
            BottomNavigationBarItem(
                icon: Icon(Icons.onetwothree_rounded), label: "Years Old"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Hire me")
          ],
        ));
  }
}
