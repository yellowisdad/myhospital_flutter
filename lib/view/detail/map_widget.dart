import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
// ignore: depend_on_referenced_packages, library_prefixes
import 'package:latlong2/latlong.dart' as latLng;
import 'package:provider/provider.dart';

import '../../model/hospital.dart';
import '../../viewModel/hospital_view_model.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Hospital? selectedHospital =
        Provider.of<HospitalViewModel>(context).hospital;
    //print(selectedHospital?.location.lat);

    return FlutterMap(
      options: MapOptions(
          center: latLng.LatLng(selectedHospital?.location.lat ?? 0,
              selectedHospital?.location.lng ?? 0),
          zoom: 11),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
