import 'package:flutter/material.dart';
import 'package:pruebaansem/Controller/servicesController.dart';
import 'package:pruebaansem/Model/services.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  ServicesController controller = ServicesController();
  List<Services> _datos = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    List<Services> services = await controller.getServices();
    setState(() {
      _datos = services;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Servicios activos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
              ),
            ),
          ),
          _datos.isEmpty
              ? SliverToBoxAdapter(
                  child: Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.blueAccent, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            height: 120.0,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Icon(
                                    Icons.directions_car,
                                    size: 50.0,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${_datos[index].firstName} ${_datos[index].lastName}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      "${_datos[index].brand} - ${_datos[index].model} - ${_datos[index].colour}",
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    Text(
                                      "${_datos[index].licensePlate}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }, childCount: _datos.length),
                ),
        ],
      ),
    );
  }
}
