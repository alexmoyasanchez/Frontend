import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_auth/Screens/Estadisticas/estadisticas_screen.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/generated/l10n.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String circulo1, circulo2, circulo3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

  if(S.current.usuariosestadistica == "Usuarios"){
    circulo1 = 'assets/images/azul_circle.png';
    circulo2 = 'assets/images/blanco_circle.png';
    circulo3 = 'assets/images/rosa_circle.png';
  }
  else if(S.current.usuariosestadistica == "Users"){
    circulo1 = 'assets/images/blue_circle.png';
    circulo2 = 'assets/images/white_circle.png';
    circulo3 = 'assets/images/pink_circle.png';
  }  

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: FutureBuilder(
            future: getEstadisticas(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                    child: Center(child: CircularProgressIndicator()));
              } else {
                numusuarios = double.parse(snapshot.data[0].numUsuarios);
                numbares = double.parse(snapshot.data[0].numBares);
                numcomunidades = double.parse(snapshot.data[0].numComunidades);
                double maximo;
                if(numusuarios > numbares || numusuarios > numcomunidades){
                  maximo = numusuarios;
                }
                else if(numbares > numusuarios || numbares > numcomunidades){
                  maximo = numbares;
                }
                else if(numcomunidades > numusuarios || numcomunidades > numbares){
                  maximo = numcomunidades;
                }
                List<BarChartGroupData> barChartGroupData = [
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(y: numusuarios, colors: [Colors.lightBlue]),
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(y: numbares, colors: [Colors.white]),
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(y: numcomunidades, colors: [Colors.pink[200]]),
                  ]),
                ];
                return Scaffold(
                    backgroundColor: Colors.black,
                    body: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Row(children: [
                            CircleAvatar(
                              radius: 58.0,
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage(circulo1),
                            ),
                            CircleAvatar(
                              radius: 58.0,
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage(circulo2),
                            ),
                            CircleAvatar(
                              radius: 58.0,
                              backgroundColor: Colors.black,
                              backgroundImage:
                                  AssetImage(circulo3),
                            )
                          ]),
                          SizedBox(height: 50.0),
                          SizedBox(
                            height: 350.0,
                            child: BarChart(BarChartData(
                                titlesData: FlTitlesData(
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTextStyles: (context, value) =>
                                        TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                    getTitles: (value) {
                                      switch (value.toInt()) {
                                        case 1:
                                          return S.current.usuariosestadistica;
                                        case 2:
                                          return S.current.baresestadistica;
                                        case 3:
                                          return S.current.comunidadesestadistica;
                                      }
                                      return ' ';
                                    },
                                  ),
                                  leftTitles: SideTitles(
                                    interval: 4,
                                    showTitles: true,
                                    getTextStyles: (context, value) =>
                                        TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                    getTitles: (value) {
                                      if (value.toInt() == 0)
                                        return '';
                                      else 
                                        return value.toInt().toString();
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(
                                    border: Border.all(
                                        color: Colors.white, width: 0.5)),
                                alignment: BarChartAlignment.spaceEvenly,
                                maxY: maximo + 1,
                                barGroups: barChartGroupData,
                                backgroundColor: Colors.black)),
                          )
                        ],
                      ),
                    ));
              }
            }),
      ),
    );
  }
}
