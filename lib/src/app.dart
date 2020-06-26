import 'package:flutter/material.dart';

import 'package:api_materias/src/screens/home_screen.dart';
import 'package:api_materias/src/screens/add_signature.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        routes: {
          '/materia' : (context) => AddMateriaPage()
        },
        home: new ScreenPage()
    );
  }
}

class ScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Web Api Materias Azure'),
        ),
        body: ListaMateria(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/materia');
          },
          tooltip: 'Agregar Materia',
          child: Icon(Icons.add),
        )
      );
  }
}