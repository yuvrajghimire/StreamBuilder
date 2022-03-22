import 'package:flutter/material.dart';

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
          color: Color(0xff333335)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.surfing, color: Colors.white),
                  SizedBox(width: 10),
                  Text('UV index', style: TextStyle(color: Colors.white)),
                ],
              ),
              Text('${weather.current.uv}',
                  style: TextStyle(color: Colors.white))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.surfing, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Sunrise', style: TextStyle(color: Colors.white)),
                ],
              ),
              Text('${weather.forecast.forecastday[0].astro.sunrise}',
                  style: TextStyle(color: Colors.white))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.surfing, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Sunset', style: TextStyle(color: Colors.white)),
                ],
              ),
              Text('${weather.forecast.forecastday[0].astro.sunset}',
                  style: TextStyle(color: Colors.white))
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.surfing, color: Colors.white),
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
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
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
                  Icon(Icons.surfing, color: Colors.white),
                  SizedBox(width: 10),
                  Text('Humidity', style: TextStyle(color: Colors.white)),
                ],
              ),
              Text('${weather.current.humidity}%',
                  style: TextStyle(color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}
