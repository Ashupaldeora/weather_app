class DataModel {
  double? temperatureCelsius, temperatureFahrenheit;
  String? localTime, condition, location, lastUpdated;

  DataModel(
      {required this.localTime,
      required this.temperatureCelsius,
      required this.temperatureFahrenheit,
      required this.condition,
      required this.location,
      required this.lastUpdated});
  DataModel.temp();
  factory DataModel.fromJson(Map json) {
    return DataModel(
        localTime: json['location']['localtime'],
        temperatureCelsius: json['current']['temp_c'],
        temperatureFahrenheit: json['current']['temp_f'],
        condition: json['current']['condition']['text'],
        location: json['location']['name'],
        lastUpdated: json['current']['last_updated']);
  }
}
