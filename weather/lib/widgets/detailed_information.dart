import 'package:flutter/material.dart';
import 'package:weather/constants/constants.dart';
import 'package:weather/tools/uv_index.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

class DetailedInformation extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final weather;
  const DetailedInformation({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: containerColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.wb_sunny, color: Colors.white),
                  SizedBox(width: 10),
                  Text('UV index', style: TextStyle(color: Colors.white)),
                ],
              ),
              Text('${uvIndex(weather.current.uv)}',
                  style: const TextStyle(color: Colors.white))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Meteocons.sunrise, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Sunrise', style: TextStyle(color: Colors.white)),
                ],
              ),
              Text('${weather.forecast.forecastday[0].astro.sunrise}',
                  style: const TextStyle(color: Colors.white))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Meteocons.fog_sun, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Sunset', style: TextStyle(color: Colors.white)),
                ],
              ),
              Text('${weather.forecast.forecastday[0].astro.sunset}',
                  style: const TextStyle(color: Colors.white))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Meteocons.wind, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Wind', style: TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Text('${weather.current.windKph} km/h',
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(width: 10),
                  Transform.rotate(
                    angle: weather.current.windDegree.toDouble(),
                    child: const Icon(Icons.navigation,
                        color: Colors.white, size: 20),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(RpgAwesome.droplet, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Humidity', style: TextStyle(color: Colors.white)),
                ],
              ),
              Text('${weather.current.humidity}%',
                  style: const TextStyle(color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}
