import 'package:intl/intl.dart';

class DataModel {
  double? temperatureCelsius, temperatureFahrenheit;
  String? localTime, condition, location, lastUpdated, region, country;
  Forecast? forecast;
  DataModel.temp();
  DataModel({
    required this.localTime,
    required this.temperatureCelsius,
    required this.temperatureFahrenheit,
    required this.condition,
    required this.location,
    required this.lastUpdated,
    required this.country,
    required this.region,
    required this.forecast,
  });

  factory DataModel.fromJson(Map json) {
    String dateTimeStr = json['current']['last_updated'];
    RegExp regExp = RegExp(r'\d{2}:\d{2}');
    String? timeStr = regExp.firstMatch(dateTimeStr)?.group(0);

    return DataModel(
      country: json['location']['country'],
      region: json['location']['region'],
      localTime: json['location']['localtime'],
      temperatureCelsius: json['current']['temp_c'],
      temperatureFahrenheit: json['current']['temp_f'],
      condition: json['current']['condition']['text'],
      location: json['location']['name'],
      lastUpdated: timeStr,
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}

class Forecast {
  final List<ForecastDay> forecastDay;

  Forecast({required this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastDay: (json['forecastday'] as List)
          .map((i) => ForecastDay.fromJson(i))
          .toList(),
    );
  }
}

class ForecastDay {
  final String date;
  final ForecastDetails day;

  ForecastDay({
    required this.date,
    required this.day,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      day: ForecastDetails.fromJson(json['day']),
    );
  }
  String get formattedDate {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  String get dayOfWeek {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('EEEE').format(dateTime);
  }
}

class ForecastDetails {
  final double maxTempC;
  final double minTempC;
  final double maxTempF;
  final double minTempF;
  final String conditionText;

  ForecastDetails({
    required this.maxTempC,
    required this.minTempC,
    required this.maxTempF,
    required this.minTempF,
    required this.conditionText,
  });

  factory ForecastDetails.fromJson(Map<String, dynamic> json) {
    return ForecastDetails(
      maxTempC: json['maxtemp_c'],
      minTempC: json['mintemp_c'],
      maxTempF: json['maxtemp_f'],
      minTempF: json['mintemp_f'],
      conditionText: json['condition']['text'],
    );
  }
}
