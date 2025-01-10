import 'package:controle_robo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Configs extends StatefulWidget {
  const Configs({super.key});

  @override
  State<Configs> createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {
  bool _isLoading = false;
  late Future<Map<String, String?>> _getServerData;

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Map<String, String?>> _getServerSettingsAsync() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'ip': prefs.getString('server_ip'),

    };
  }


  @override
  void initState() {
    super.initState();
    _getServerData = _getServerSettingsAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
            ]);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainApp()),
            );
          },
        ),
      ),
      body: const Stack(
        children: <Widget>[
          Text("configs"),
        ],
      )
    );
  }
}
