import 'package:counter_app/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //Quando retornar algum erro
            return Material(
              child: Center(
                  child: Text(
                "Não foi possível inicializar o Firebase",
                textDirection: TextDirection.ltr,
              )),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            //Conexão de estado dei certp
            return AppWidget();
          } else {
            // Enquanto não carrega
            return Material(
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
