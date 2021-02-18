import 'location.dart';
import 'networking.dart';

class WeatherModel {
  String apiKey = '72e25a52b669758e337b66aa0068dd27';
  String apiURL = 'https://api.openweathermap.org/data/2.5/weather';

  Future<dynamic> getCityWeather(String cityName) async {
    String newURL = '$apiURL?q=$cityName&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url: newURL);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData () async {
    Location obj = new Location();
    await obj.getPosition();

    NetworkHelper networkHelper = NetworkHelper(url: '$apiURL?lat=${obj.latitude}&lon=${obj.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    }
    else if (condition < 400) {
      return '🌧';
    }
    else if (condition < 600) {
      return '☔️';
    }
    else if (condition < 700) {
      return '☃️';
    }
    else if (condition < 800) {
      return '🌫';
    }
    else if (condition == 800) {
      return '☀️';
    }
    else if (condition <= 804) {
      return '☁️';
    }
    else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
