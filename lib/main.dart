import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Serviços
import 'services/service.dart';
// Páginas
import 'configs.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a orientação da tela inicialmente
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);

    return MaterialApp(
      title: 'Main App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Altere a orientação ao navegar para a página de configurações
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
              ]);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Configs()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Botões UP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("esquerda-up");
                      },
                      child: const Text("Esquerda-UP"),
                    ),
                    const SizedBox(width: 300),
                    ElevatedButton(
                      onPressed: () {
                        print("direita-UP");
                      },
                      child: const Text("Direita-UP"),
                    ),
                  ],
                ),
                // Botões DOWN
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("esquerda-DOWN");
                      },
                      child: const Text("Esquerda-DOWN"),
                    ),
                    const SizedBox(width: 300),
                    ElevatedButton(
                      onPressed: () {
                        print("direita-DOWN");
                      },
                      child: const Text("Direita-DOWN"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
