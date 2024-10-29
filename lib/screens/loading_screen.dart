import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.low,
      distanceFilter: 1000,
    );

    LocationPermission permission = await Geolocator.requestPermission();
    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    print(position);
    print(permission);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
            print('CLick');
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
