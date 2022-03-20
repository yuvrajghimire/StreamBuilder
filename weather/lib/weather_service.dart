// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class WeatherService {
//   getWeather(_streamController) async {
//     Uri uri = Uri.parse(
//         'http://api.weatherapi.com/v1/current.json?key=1f4481ebdd004ab8aa233627222003&q=London&aqi=no');
//     var response = await http.get(uri);
//     if (response.statusCode == 200) {
//       var data = await json.decode(response.body);
//       // print(data);
//       return data;
//     } else {
//       return 'failed';
//     }
//   }
// }
