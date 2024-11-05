import 'package:flutter/material.dart';

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
  }

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Широта: ${location.latitude}, Довгота: ${location.longitude}');
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
