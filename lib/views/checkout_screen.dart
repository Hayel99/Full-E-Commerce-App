import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Marker> _list = [];

  @override
  void initState() {
    super.initState();
    _determinePosition().then((value) {
      print('longitude = ${value.longitude}');
      print('latitude = ${value.latitude}');
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: GoogleMap(
                markers: _list.toSet(),
                onLongPress: (arg) {
                  setState(() {
                    _list.add(
                        Marker(markerId: const MarkerId("1"), position: arg));
                  });
                },
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(32.0246689, 35.8771942),
                  zoom: 17.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                maxLines: 4,
                decoration: InputDecoration(hintText: 'Note'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child:
                    ElevatedButton(onPressed: () {}, child: const Text('Done')))
          ],
        ),
      ),
    );
  }
}
