import 'package:dio/dio.dart';

import 'package:pruebaansem/Model/services.dart';

class ServicesController {
  Future<List<Services>> getServices() async {
    List<Services> datos = [];
    try {
      Dio dio = new Dio();

      dio.options.baseUrl = "https://ansem-test.herokuapp.com";
      dio.options.connectTimeout = 5000; // 5 segundos
      dio.options.receiveTimeout = 5000; // 5 segundos

      Response services = await dio.get("/services");

      var infoMap = services.data;

      infoMap["services"].forEach(
        (dataMap) async {
          Services _service = Services.map(dataMap);
          datos.add(_service);
        },
      );
      return datos;
    } catch (e) {
      print(e);
      return datos;
    }
  }
}
