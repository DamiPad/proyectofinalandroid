
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:proyectofinal_android/api/apiservice.dart';
import 'package:proyectofinal_android/api/profile.dart';


class BarrasScreen extends StatefulWidget {
  BarrasScreen({Key key}) : super(key: key);

  @override
  _BarrasScreenState createState() => _BarrasScreenState();
}

class _BarrasScreenState extends State<BarrasScreen> {
  ApiService apiService;
  List<charts.Series<Materias, String>> datos;
  final bool animate = false;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: apiService.getMaterias(),
        builder: (BuildContext context, AsyncSnapshot<List<Materias>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                  "Something wrong with message: ${snapshot.error.toString()}"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            createSerie(snapshot.data);
            return simpleBarChart();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }


 Widget simpleBarChart() {
    return Scaffold(
      appBar: AppBar(title: Text('Grafica de barras Materia-Calificacion'),
     backgroundColor: Color.fromRGBO(51, 130, 255, 0.5),), 
     body: Container(
        height: 500,
        width: 600,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            height: 300,
            width: 300,
            child: Center(
                    child: charts.BarChart(
                      datos,
                      animate: animate,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  createSerie(List<Materias> list){
    datos = [
      charts.Series<Materias, String>(
        id: 'Grafica de Barras',
        data: list,
        domainFn: (Materias materia, _) => materia.materia,
        measureFn: (Materias materia, _) => materia.calificacion,
        labelAccessorFn: (Materias row,_)=>'${row.calificacion}',
      )
      
    ];
    
  }
}