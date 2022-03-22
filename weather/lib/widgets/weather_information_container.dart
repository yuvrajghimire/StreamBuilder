import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherInformationContainer extends StatelessWidget {
  final dynamic weather;
  const WeatherInformationContainer({Key? key, required this.weather})
      : super(key: key);

  final Color textColor = Colors.white;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${weather.location!.name!}, ${weather.location!.country!}',
              style: TextStyle(color: textColor, fontSize: 18)),
          const SizedBox(height: 5),
          Text(DateFormat.yMMMd().format(DateTime.now()),
              style: TextStyle(color: Colors.grey.shade400)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.surfing, color: textColor),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(weather.current!.tempC.toString() + '°',
                      style: TextStyle(color: textColor, fontSize: 40)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(weather.current!.condition!.text.toString(),
                      style: TextStyle(color: Colors.grey.shade400)),
                  const SizedBox(height: 5),
                  Text(
                      '${weather.forecast!.forecastday[0]!.day.maxtempC}° / ${weather.forecast!.forecastday[0]!.day.mintempC}°',
                      style: TextStyle(color: Colors.grey.shade400)),
                  const SizedBox(height: 5),
                  Text(
                      'Feels like ' +
                          weather.current!.feelslikeC.toString() +
                          ' ℃',
                      style: TextStyle(color: Colors.grey.shade400)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
