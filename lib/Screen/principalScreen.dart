import 'package:flutter/material.dart';
import 'package:pruebaansem/Model/services.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  List<Services> datos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      body: CustomScrollView(),
    );
  }
}
