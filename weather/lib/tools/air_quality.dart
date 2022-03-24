import 'package:flutter/material.dart';

airQuality(index) {
  if (index >= 0 && index <= 50) {
    return 'Good';
  } else if (index >= 51 && index <= 100) {
    return 'Moderate';
  } else if (index >= 101 && index <= 150) {
    return 'Unhealthy for Sensitive Groups';
  } else if (index >= 151 && index <= 200) {
    return 'Unhealthy';
  } else if (index >= 201 && index <= 300) {
    return 'Very Unhealthy';
  } else if (index >= 301) {
    return 'Hazardous';
  }
}

airQualityColor(str) {
  if (str == 'Good') {
    return const Color(0xff009966);
  } else if (str == 'Moderate') {
    return const Color(0xffffde33);
  } else if (str == 'Unhealthy for Sensitive Groups') {
    return const Color(0xffff9933);
  } else if (str == 'Unhealthy') {
    return const Color(0xffcc0033);
  } else if (str == 'Very Unhealthy') {
    return const Color(0xff660099);
  } else if (str == 'Hazardous') {
    return const Color(0xff7e0023);
  }
}

airQualityMessage(str) {
  if (str == 'Good') {
    return 'Air quality is considered satisfactory, and air pollution poses little or no risk';
  } else if (str == 'Moderate') {
    return 'Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.';
  } else if (str == 'Unhealthy for Sensitive Groups') {
    return 'Members of sensitive groups may experience health effects. The general public is not likely to be affected.';
  } else if (str == 'Unhealthy') {
    return 'Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects';
  } else if (str == 'Very Unhealthy') {
    return 'Health warnings of emergency conditions. The entire population is more likely to be affected.';
  } else if (str == 'Hazardous') {
    return 'Health alert: everyone may experience more serious health effects';
  }
}

airQualityMessageCautionary(str) {
  if (str == 'Good') {
    return 'None';
  } else if (str == 'Moderate') {
    return 'Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion.';
  } else if (str == 'Unhealthy for Sensitive Groups') {
    return 'Active children and adults, and people with respiratory disease, such as asthma, should limit prolonged outdoor exertion.';
  } else if (str == 'Unhealthy') {
    return 'Active children and adults, and people with respiratory disease, such as asthma, should avoid prolonged outdoor exertion; everyone else, especially children, should limit prolonged outdoor exertion';
  } else if (str == 'Very Unhealthy') {
    return 'Active children and adults, and people with respiratory disease, such as asthma, should avoid all outdoor exertion; everyone else, especially children, should limit outdoor exertion.';
  } else if (str == 'Hazardous') {
    return 'Everyone should avoid all outdoor exertion';
  }
}
