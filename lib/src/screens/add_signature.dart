
import 'package:api_materias/src/network/api_materias.dart';
import 'package:flutter/material.dart';

class AddMateriaPage extends StatefulWidget {
  
  AddMateriaPage({Key key}) : super(key: key);

  @override
  _AddMateriaPageState createState() => _AddMateriaPageState();
}

class _AddMateriaPageState extends State<AddMateriaPage> {

  final _nombreController  = TextEditingController();
  final _profeController   = TextEditingController(); 
  final _cuatriController  = TextEditingController();
  final _horarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Materia'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(hintText: 'Nombre de la materia'),
              ),
              TextField(
                controller: _profeController,
                decoration: InputDecoration(hintText: 'Nombre del profesor'),
              ),
              TextField(
                controller: _cuatriController,
                decoration: InputDecoration(hintText: 'Cuatrimestre de la materia'),
              ),
              TextField(
                controller: _horarioController,
                decoration: InputDecoration(hintText: 'Horario de la materia'),
              ),
              RaisedButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                color: Colors.blueAccent[100],
                onPressed: (){
                  final body = {
                    "Nombre"   : _nombreController.text,
                    "Profesor" : _profeController.text,
                    "Cuatrimestre" : _cuatriController.text,
                    "Horario" : _horarioController.text,
                  };
                  ApiMaterias.addMateria(body).then((success) => {
                    if( success ){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Signature has been added!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: (){
                                Navigator.pop(context);
                                _nombreController.text = '';
                                _profeController.text = '';
                                _cuatriController.text = '';
                                _horarioController.text = '';
                              }, 
                              child: Text('Ok')
                            )
                          ],
                        )
                      )
                    }else{
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error adding signature!!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: (){ Navigator.pop(context);},
                              child: Text('OK'),
                            )
                          ],
                        ),
                      )
                    }
                  });
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}