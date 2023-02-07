import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myhospital/model/hospital.dart';
import 'package:myhospital/view/detail/hospital_datail_page.dart';
import 'package:myhospital/viewModel/hospital_view_model.dart';
import 'package:provider/provider.dart';

class HospitalWidget extends StatefulWidget {
  final List<Hospital> entries;

//init
  const HospitalWidget(this.entries, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HospitalWidgetState createState() => _HospitalWidgetState();
}

class _HospitalWidgetState extends State<HospitalWidget> {
  //hospital card view
  Widget _buildItem(Hospital media) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: Card(
          child: ListTile(
            title: Text(media.name,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0)),
            leading: const Icon(
              Icons.local_hospital,
              color: Colors.black,
            ),
          ),
        ));
  }

  // listView
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.entries.length,
        itemBuilder: (context, index) {
          var item = widget.entries[index];
          return InkWell(
            onTap: () {
              Provider.of<HospitalViewModel>(context, listen: false)
                  .setSelectedHotpital(item);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailHospital()),
              );
              if (kDebugMode) {
                print('click >>$item');
              }
            },
            child: _buildItem(item),
          );
        });
  }
}
