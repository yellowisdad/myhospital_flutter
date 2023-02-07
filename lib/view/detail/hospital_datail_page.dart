import 'package:flutter/material.dart';
import 'package:myhospital/model/hospital.dart';
import 'package:myhospital/view/detail/map_widget.dart';
import 'package:myhospital/view/detail/waitinglist_widget.dart';
import 'package:myhospital/viewModel/hospital_view_model.dart';
import 'package:provider/provider.dart';

class DetailHospital extends StatelessWidget {
  const DetailHospital({super.key});

  @override
  Widget build(BuildContext context) {
    Hospital? selectedHospital =
        Provider.of<HospitalViewModel>(context).hospital;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedHospital?.name ?? 'Hospital Detail'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            alignment: Alignment.bottomCenter,
            child: const MapWidget(),
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: const Text('Waiting List',
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          ),
          const Expanded(
            child: WaitingListWidget(),
          ),
        ],
      ),
    );
  }
}
