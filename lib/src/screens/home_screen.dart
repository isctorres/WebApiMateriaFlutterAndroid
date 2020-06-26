import 'package:flutter/material.dart';

import 'package:api_materias/src/network/api_materias.dart';
import 'package:api_materias/src/views/item_list.dart';

class ListaMateria extends StatefulWidget {
  ListaMateria({Key key}) : super(key: key);

  @override
  _ListaMateriaState createState() => _ListaMateriaState();
}

class _ListaMateriaState extends State<ListaMateria> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiMaterias.getMaterias(),
      builder: (context, snapshot){
        final materias = snapshot.data;
        if (snapshot.hasData) {
          if( snapshot.connectionState == ConnectionState.done){
            return ListView.separated(
              separatorBuilder: (context,index){
                return Divider(
                  height: 2.0,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index){
                return ItemList(materias[index]['Nombre'],materias[index]['Profesor'],materias[index]['Cuatrimestre'],materias[index]['Horario']);
              },
              itemCount: materias.length,
            );
          }
        }
        else{
          return Center(
             child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}