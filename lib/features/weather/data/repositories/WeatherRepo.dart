// responsible for communicating to the server
import 'package:eagle_weather/features/weather/data/models/wather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // to convert our json objects to models

class WeatherRepo {
  // this class will be responsible for calling the weather api

  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=6cbee30e3b0163be5df22eda4a538e66"),);

    if (result.statusCode != 200) {
      throw Exception();
    }

    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return WeatherModel.fromJson(jsonWeather);
  }
}
