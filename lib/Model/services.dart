class Services {
  String firstName, lastName, brand, model, colour, licensePlate;

  Services.map(Map<String, dynamic> parsedJson)
      : firstName = parsedJson["user"]["firstName"],
        lastName = parsedJson["user"]["lastName"],
        brand = parsedJson["vehicle"]["brand"],
        model = parsedJson["vehicle"]["model"],
        colour = parsedJson["vehicle"]["colour"],
        licensePlate = parsedJson["vehicle"]["licensePlate"];
}
