import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:weather/constants/constants.dart';
import 'package:weather/models/model.dart';
import 'package:weather/tools/weekday.dart';

class ForecastWeather extends StatelessWidget {
  const ForecastWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

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
          const Text('Next 3 days',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 5),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: weather.forecast!.forecastday!.length,
            itemBuilder: (context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                        weekDay(DateTime.parse(
                                '${weather.forecast!.forecastday![index].date}')
                            .weekday),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Icon(RpgAwesome.droplet,
                              color: Colors.white, size: 18),
                        ),
                        Expanded(
                          child: Text(
                              '${weather.forecast!.forecastday![index].day!.avghumidity}%',
                              style: const TextStyle(color: Colors.grey)),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CachedNetworkImage(
                                imageUrl:
                                    'https:${weather.forecast!.forecastday![index].day!.condition!.icon}',
                                fit: BoxFit.cover),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          '${weather.forecast!.forecastday![index].day!.maxtempC}° / ${weather.forecast!.forecastday![index].day!.mintempC}°',
                          style: const TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
