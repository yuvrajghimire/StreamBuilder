// 0 is night
// 1 is day
checkDayOrNight(url) {
  if (url == '//cdn.weatherapi.com/weather/64x64/day/113.png') {
    return 1;
  } else if (url == '//cdn.weatherapi.com/weather/64x64/night/113.png') {
    return 0;
  }
}
