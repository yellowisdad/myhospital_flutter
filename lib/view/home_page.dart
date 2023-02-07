// ignore: file_names
import 'package:flutter/material.dart';
import 'package:myhospital/model/hospital.dart';
import 'package:myhospital/view/hospital_widget.dart';
import 'package:myhospital/viewModel/hospital_view_model.dart';
import 'package:provider/provider.dart';
import '../model/apis/api_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //fetchData when init
  @override
  void initState() {
    super.initState();
    var _ = Provider.of<HospitalViewModel>(context, listen: false).fetchData();
  }

// getWidget when changeNotifi
  Widget getWidget(BuildContext context, ApiResponse apiResponse) {
    List<Hospital>? mediaList = apiResponse.data as List<Hospital>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(
          child: Text('Loading Hospitals...'),
        );
      case Status.COMPLETED:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(flex: 8, child: HospitalWidget(mediaList!)),
          ],
        );
      case Status.ERROR:
        return const Center(
          child: Text('ERROR'),
        );
      case Status.INITIAL:
      default:
        return const Center(
          child: Text('Ready for get Hospitals'),
        );
    }
  }

  void _reload() {
    setState(() {
      Provider.of<HospitalViewModel>(context, listen: false).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    ApiResponse apiResponse = Provider.of<HospitalViewModel>(context).response;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hospitals"),
      ),
      backgroundColor: const Color.fromRGBO(151, 192, 92, 1),
      body: Center(child: getWidget(context, apiResponse)),
      floatingActionButton: FloatingActionButton(
        onPressed: _reload,
        child: const Icon(Icons.update),
      ),
    );
  }
}
