import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myhospital/model/waitinglist.dart';

import '../../model/hospital.dart';
import '../../viewModel/hospital_view_model.dart';

class WaitingListWidget extends StatelessWidget {
  const WaitingListWidget({super.key});

  // listView
  @override
  Widget build(BuildContext context) {
    Hospital? selectedHospital =
        Provider.of<HospitalViewModel>(context).hospital;
    if ((selectedHospital?.waitingList?.length ?? 0) > 0) {
      return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: selectedHospital?.waitingList?.length ?? 0,
        itemBuilder: (context, index) {
          var item =
              WaitingList.fromJson(selectedHospital!.waitingList![index]);

          return Container(
            height: 50,
            //color base on level Of Pain
            color: Colors.red[item.levelOfPain * 100],
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('LevelOfPain \n${item.levelOfPain}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0)),
                  Text('PatientCount \n${item.patientCount}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0)),
                  Text('ProcessTime \n${item.averageProcessTime}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.0)),
                ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
      //No Waiting List Case
    } else {
      return const Text('No Waiting List');
    }
  }
}
