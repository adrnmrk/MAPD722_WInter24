class WeatherObject {
  String mainWeather = "";
  double temp = 0.0;
  int humidity = 0;
  String cityName = "";
  String icon = "";
  String zipCode = ""; // Add zipCode field

  WeatherObject(
      this.temp, this.humidity, this.icon, this.mainWeather, this.cityName, this.zipCode); // Update constructor to include zipCode
}
