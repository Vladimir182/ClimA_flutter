import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    getData();
  }

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Широта: ${location.latitude}, Довгота: ${location.longitude}');
  }

  Future<void> getData() async {
    Location location = Location();
    await location.getCurrentLocation();
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=29823b40489a1a0d5ae3825f53662c9b'));

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build done');
    return const Scaffold(
        // body: Center(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       getLocation();
        //     },
        //     child: const Text('Get Location'),
        //   ),
        // ),
        );
  }
}
