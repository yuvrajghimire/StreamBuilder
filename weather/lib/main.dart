import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StreamController _streamController = StreamController();
  late Stream _stream;
  Weather weather = Weather();

  @override
  void initState() {
    super.initState();
    _stream = _streamController.stream;
    Timer.periodic(const Duration(seconds: 3), (timer) {
      getWeather();
    });
  }

  getWeather() async {
    Uri uri = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=1f4481ebdd004ab8aa233627222003&q=Kathmandu&aqi=no');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var data = await json.decode(response.body);
      // print(data);
      weather = Weather.fromJson(data);
      _streamController.add(weather);
      return data;
    } else {
      return 'failed';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: StreamBuilder(
            stream: _stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  weather = snapshot.data as Weather;
                  return ListView(
                    children: [
                      const Center(
                          child: Text('Weather',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold))),
                      ListTile(
                        leading: const Text('Location'),
                        trailing: Text(
                            '${weather.location!.name!}, ${weather.location!.country!}'),
                      ),
                      ListTile(
                        leading: const Text('Weather'),
                        trailing:
                            Text(weather.current!.tempC.toString() + ' ℃'),
                      ),
                      ListTile(
                        leading: const Text('Time'),
                        trailing: Text(weather.location!.localtime.toString()),
                      ),
                      ListTile(
                        leading: const Text('Condition'),
                        trailing:
                            Text(weather.current!.condition!.text.toString()),
                      ),
                      ListTile(
                        leading: const Text('Feels Like'),
                        trailing:
                            Text(weather.current!.feelslikeC.toString() + ' ℃'),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const Center(child: Text('No data'));
            },
          ),
        ),
      ),
    );
  }
}
