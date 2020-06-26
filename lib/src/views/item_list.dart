import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {

  final String _nombre;
  final String _profesor;
  final String _cuatrimestre;
  final String _horario;

  ItemList(this._nombre,this._profesor,this._cuatrimestre,this._horario);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Row(
            children: <Widget>[
              Icon(Icons.school,size: 60.0),
              Container(
                width: MediaQuery.of(context).size.width - 100.0,
                margin: EdgeInsets.only(left: 10.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('Materia: $_nombre' ?? '', style: TextStyle(fontSize: 18.0),),
                    Text('Profesor: $_profesor' ?? '', style: TextStyle(fontSize: 15.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(_cuatrimestre ?? ''),
                        Text(_horario ?? '')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
    );
  }
}