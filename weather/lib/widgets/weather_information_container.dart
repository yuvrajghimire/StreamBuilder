import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:intl/intl.dart';
import 'package:weather/constants/constants.dart';
// import 'package:weather/tools/check_day_or_night.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WeatherInformationContainer extends StatelessWidget {
  final dynamic weather;
  WeatherInformationContainer({Key? key, required this.weather})
      : super(key: key);

  final Color textColor = Colors.white;
  final currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: containerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${weather.location!.name!}, ${weather.location!.country!}',
            style: TextStyle(color: textColor, fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat.yMMMMEEEEd().format(
              DateTime.now(),
            ),
            style: TextStyle(color: Colors.grey.shade400),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://${weather.current.condition.icon.substring(2)}'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    weather.current!.tempC.toString() + '°',
                    style: TextStyle(color: textColor, fontSize: 40),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    weather.current!.condition!.text.toString(),
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  const SizedBox(height: 5),
                  Text(
                      '${weather.forecast!.forecastday[0]!.day.maxtempC}° / ${weather.forecast!.forecastday[0]!.day.mintempC}°',
                      style: TextStyle(color: Colors.grey.shade400)),
                  const SizedBox(height: 5),
                  Text(
                    'Feels like ' +
                        weather.current!.feelslikeC.toString() +
                        ' ℃',
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text('Today',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 150.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: weather.forecast.forecastday[0].hour.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return index >=
                        int.parse(currentTime.toString().substring(11, 13))
                    ? Column(
                        children: [
                          Text(
                            '${weather.forecast.forecastday[0].hour[index].time.substring(11)}',
                            style: TextStyle(color: textColor),
                          ),
                          // removed the locally saved icons for today forcast and used the original url from the api
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://${weather.forecast.forecastday[0].hour[index].condition.icon.substring(2)}',
                              // fit: BoxFit.contain,
                              width: 50,
                            ),
                          ),
                          Text(
                            '${weather.forecast.forecastday[0].hour[index].tempC}°',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Icon(RpgAwesome.droplet,
                                  color: Colors.white, size: 18),
                              Text(
                                '${weather.forecast.forecastday[0].hour[index].humidity}%',
                                style:
                                    TextStyle(color: textColor, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      )
                    : const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
