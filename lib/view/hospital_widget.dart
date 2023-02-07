import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myhospital/model/hospital.dart';

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
  Widget _buildSongItem(Hospital media) {
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
          return InkWell(
            onTap: () {
              if (kDebugMode) {
                print('click >>${widget.entries[index].name}');
              }
            },
            child: _buildSongItem(widget.entries[index]),
          );
        });
  }
}
