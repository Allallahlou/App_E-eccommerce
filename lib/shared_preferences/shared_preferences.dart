import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineSupportPage extends StatefulWidget {
  const OfflineSupportPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OfflineSupportPageState createState() => _OfflineSupportPageState();
}

class _OfflineSupportPageState extends State<OfflineSupportPage> {
  String _savedData = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedData = prefs.getString('savedData') ?? 'No data saved';
    });
  }

  void _saveData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('savedData', data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offline Support"),
      ),
      body: Column(
        children: [
          Text('Saved Data: $_savedData'),
          ElevatedButton(
            onPressed: () {
              _saveData('New data');
            },
            child: const Text('Save Data'),
          ),
        ],
      ),
    );
  }
}
