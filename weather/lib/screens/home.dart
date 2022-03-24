import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/models/model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/widgets/air_quality.dart';
import 'package:weather/widgets/detailed_information.dart';
import 'package:weather/widgets/forecast.dart';
import 'package:weather/widgets/weather_information_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController _streamController = StreamController();
  late Stream _stream;
  Weather weather = Weather();
  String place = 'Lalitpur';

  @override
  void initState() {
    super.initState();
    _stream = _streamController.stream;
    getWeather();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      getWeather();
    });
  }

  getWeather() async {
    try {
      Map<String, String> userHeader = {
        "Content-type": "application/json",
        "Accept": "application/json"
      };
      Uri uri = Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=1f4481ebdd004ab8aa233627222003&q=$place&days=7&aqi=yes&alerts=no');
      var response = await http.get(uri, headers: userHeader);
      if (response.statusCode == 200) {
        var data = await json.decode(response.body);
        // print(data);
        weather = Weather.fromJson(data);
        _streamController.add(weather);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Some error occured",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff131314),
        body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                weather = snapshot.data as Weather;
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 40),
                    const Center(
                      child: Text(
                        'Weather',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    WeatherInformationContainer(weather: weather),
                    const SizedBox(height: 20),
                    ForecastWeather(weather: weather),
                    const SizedBox(height: 20),
                    DetailedInformation(weather: weather),
                    const SizedBox(height: 20),
                    AirQualityContainer(weather: weather)
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            return const Center(
                child: Text('Something went wrong',
                    style: TextStyle(color: Colors.white)));
          },
        ),
      ),
    );
  }
}
