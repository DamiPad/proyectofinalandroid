import 'package:flutter/material.dart';
import 'package:proyectofinal_android/api/apiservice.dart';
import 'package:proyectofinal_android/api/profile.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class CalificacionesScreen extends StatefulWidget {
  CalificacionesScreen({Key key}) : super(key: key);

  @override
  _CalificacionesScreenState createState() => _CalificacionesScreenState();
}

class _CalificacionesScreenState extends State<CalificacionesScreen> {
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
    return Scaffold(
      appBar: AppBar(title: Text('Calificaciones'),
      
      backgroundColor: Color.fromRGBO(51, 130, 255, 0.5),),
      body:SafeArea(
        child: Container(
          
          child: Material(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                                        Text("Materias  ", style:TextStyle(height: 5, fontSize: 20)),
                                        Text("   Calificación", style:TextStyle(height: 5, fontSize: 20)),
                      
                    ],
                ),
                Divider(
                 height: 3,
                 color: Colors.black,
                ),
                Expanded(
                  child:FutureBuilder(
                        future: apiService.getMaterias(),
                        builder: (BuildContext context, AsyncSnapshot<List<Materias>> snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                  "Something wrong with message: ${snapshot.error.toString()}"),
                            );
                          } else if (snapshot.connectionState == ConnectionState.done) {
                            print(snapshot.data);

                            //tableData(snapshot.data);
                            return  tableData(snapshot.data);//simpleBarChart();
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                ),
               

                Padding(padding: EdgeInsets.only(bottom: 100),

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                    RaisedButton(
                      onPressed: () {
                        // Add your onPressed code here!
                        Navigator.pushNamed(context,'/lineal');
                      },
                      child: Icon(Icons.timeline),
                      color: Colors.green,
                      elevation: 3,

                    ),
                    RaisedButton(
                      onPressed: () {
                        // Add your onPressed code here!
                        Navigator.pushNamed(context,'/barras');
                      },
                      child: Icon(Icons.equalizer),
                      color: Colors.green,
                      elevation: 3,

                    ),  
                    ],
                ),)
                
              ],
            ),
              
            ),
          ),
        
      ),
    );
  }

  Widget tableData(List<Materias> list){
    final materias = list;
   // print(materias[1].['Materiaa']);
    return Material(
            
                child: ListView.separated(
                      separatorBuilder:(context,index){
                        return Divider(
                          height: 2,
                          color: Colors.black,
                        );
                      },
                      itemBuilder: (context,index){
                        return ListTile(
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(materias[index].materia.toString()),
                               Divider(
                                height: 3,
                                color: Colors.black,
                              ),
                              Text(materias[index].calificacion.toString()),
      
                            ],
                          ),
                          
                        );
                      },
                      itemCount:materias.length
      ),
      
             
          
    );
  }


  Widget simpleBarChart() {
    return Container(
      height: 300,
      width: 300,
      child: Padding(
        padding: EdgeInsets.all(16),
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
    );
  }

  createSerie(List<Materias> list){
    datos = [
      charts.Series<Materias, String>(
        id: 'Grafica de Barras',
        data: list,
        domainFn: (Materias materia, _) => materia.materia,
        measureFn: (Materias materia, _) => materia.calificacion,
        
      )
      
    ];
    
  }
}
//snapshot.data.documents[index]
/*Widget simpleLinealChart() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        child: Center(
                child: charts.LineChart(
                  datos,
                  animate: animate,
                  
                ),
        ),
      ),
    );
  }

  createSerie(List<Materias> list){
    datos = [
      charts.Series<Materias, int>(
        id: 'Grafica Lineal',
        data: list,
        domainFn: (Materias materia, _) => materia.calificacion,
        measureFn: (Materias materia, _) => materia.calificacion,
        
      )
    ];
    
  }*/