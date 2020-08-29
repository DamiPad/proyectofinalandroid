import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 
class MyMapGoogle extends StatefulWidget {
  MyMapGoogle({Key key}) : super(key: key);

  @override
  _MyMapGoogleState createState() => _MyMapGoogleState();
}

class _MyMapGoogleState extends State<MyMapGoogle> {
  GoogleMapController mapController;

  static const _center = const LatLng(20.5497246,-101.2263353);
final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Universidad de La Salle Bajio',
          snippet: 'San Juan de Razos',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contactanos'),
          backgroundColor: Color.fromRGBO(162, 146, 199, 0.5),
        ),
        body: Column(
          
          
          children: <Widget>[
            Stack(
            
              children:<Widget>[
            Container(
              height: 450,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget> [
                    
                    SizedBox(height: 16.0),
                    FloatingActionButton(
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Color.fromRGBO(51, 130, 255, 0.5),
                      child: const Icon(Icons.add_location, size: 25.0),
                    ),
                  ],
                ),
              ),
            ),],),
            Padding(padding: EdgeInsets.all(30),),
            Container(
              
              child: Column(
                children: [
                  Text('Universidad de La Salle Bajio',style: TextStyle(fontStyle: FontStyle.normal,
                                                            fontFamily: 'Open Sans',fontSize: 18.0,)),
                  Padding(padding: EdgeInsets.all(18),),
                  Text('Libramiento a Morelia km 7.5',style: TextStyle(fontSize: 12.0,)),
                  Padding(padding: EdgeInsets.all(5),),
                  Text('Col. Poblado de San Juan de Razos',style: TextStyle(fontSize: 12.0,)),
                  Padding(padding: EdgeInsets.all(5)),
                  Text('C.P. 36700 Salamanca, Gto',style: TextStyle(fontSize: 12.0,)),
                  Padding(padding: EdgeInsets.all(5),),
                  Text('+52 (477) 710 85 00',style: TextStyle(fontSize: 12.0,)),
                 

                ],
              ),
            ),
            
        
          ]
    )
    )
    );
    
  }
}