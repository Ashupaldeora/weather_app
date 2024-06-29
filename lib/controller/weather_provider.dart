import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/api/api_services.dart';
import 'package:weather_app/models/data_model.dart';

class WeatherProvider extends ChangeNotifier {
  DataModel dataModel = DataModel.temp();
  String image = "assets/images/cloudy.png";
  String forecastImage = "assets/images/cloudy.png";

  Future<void> loadData(String query) async {
    dataModel =
        DataModel.fromJson(await ApiServices.apiServices.fetchData(query));
    setImage();
    notifyListeners();
  }

  void setImage() {
    image = giveImage();
    notifyListeners();
  }

  String giveImage() {
    if (dataModel.condition == "Sunny" || dataModel.condition == "Clear") {
      return "assets/images/sunny.png";
    } else if (dataModel.condition == "Cloudy" ||
        dataModel.condition == "Mist") {
      return "assets/images/cloudy (2).png";
    } else if (dataModel.condition == "Patchy light drizzle" ||
        dataModel.condition == "Patchy rain possible" ||
        dataModel.condition == "Moderate rain" ||
        dataModel.condition == "Light rain shower" ||
        dataModel.condition == "Patchy rain nearby") {
      return "assets/images/cloudy (1).png";
    } else if (dataModel.condition == "Heavy rain" ||
        dataModel.condition == "Heavy rain at times" ||
        dataModel.condition == "Moderate or heavy rain with thunder") {
      return "assets/images/storm.png";
    } else if (dataModel.condition == "Heavy snow" ||
        dataModel.condition == "Moderate snow") {
      return "assets/images/snow.png";
    } else {
      return "assets/images/cloudy.png";
    }
  }

  String giveForecastImage(int index) {
    if (dataModel.forecast!.forecastDay[index].day.conditionText == "Sunny" ||
        dataModel.forecast!.forecastDay[index].day.conditionText == "Clear") {
      return "assets/images/sunny.png";
    } else if (dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Cloudy" ||
        dataModel.forecast!.forecastDay[index].day.conditionText == "Mist") {
      return "assets/images/cloudy (2).png";
    } else if (dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Patchy light drizzle" ||
        dataModel
                .forecast!.forecastDay[index].day.conditionText ==
            "Patchy rain possible" ||
        dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Moderate rain" ||
        dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Light rain shower" ||
        dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Patchy rain nearby") {
      return "assets/images/cloudy (1).png";
    } else if (dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Heavy rain" ||
        dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Heavy rain at times" ||
        dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Moderate or heavy rain with thunder") {
      return "assets/images/storm.png";
    } else if (dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Heavy snow" ||
        dataModel.forecast!.forecastDay[index].day.conditionText ==
            "Moderate snow") {
      return "assets/images/snow.png";
    } else {
      return "assets/images/cloudy.png";
    }
  }

  WeatherProvider() {
    loadData("surat");
  }
}
