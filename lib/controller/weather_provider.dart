import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/api/api_services.dart';
import 'package:weather_app/models/data_model.dart';

class WeatherProvider extends ChangeNotifier {
  DataModel dataModel = DataModel.temp();

  Future<void> loadData(String query) async {
    dataModel =
        DataModel.fromJson(await ApiServices.apiServices.fetchData(query));
  }

  WeatherProvider() {
    loadData("surat");
  }
}
