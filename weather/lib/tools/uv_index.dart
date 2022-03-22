uvIndex(index) {
  if (index <= 2) {
    return 'Low';
  } else if (index >= 3 && index <= 5) {
    return 'Moderate';
  } else if (index >= 6 && index <= 8) {
    return 'High';
  } else if (index >= 9 && index <= 10) {
    return 'Very high';
  } else {
    return 'Extreme';
  }
}
