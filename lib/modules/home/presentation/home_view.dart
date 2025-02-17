import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Position? _currentPosition;
  bool _loadingGetPosition = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: SafeArea(
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              children: [
                if (_currentPosition != null)
                  Text(
                    "Latitude: ${_currentPosition?.latitude}\nLongitude: ${_currentPosition?.longitude}",
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => _getCurrentLocation(),
                  child: (_loadingGetPosition)
                      ? CircularProgressIndicator()
                      : Text("Get Longitude"),
                )
              ],
            ),
          ),
        ));
  }

  void _getCurrentLocation() async {
    try {
      _loadingGetPosition = true;
      print("test : $_loadingGetPosition");
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint("Location service is not enabled");
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          debugPrint("Location permission is denied");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        debugPrint("Location permission is denied forever");
      }

      Position _position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = _position;
      });

      if (_currentPosition != null) {
        _loadingGetPosition = false;
      }

      print("test : $_loadingGetPosition");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
