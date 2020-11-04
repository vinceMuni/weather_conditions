class WeatherForecast {
  City city;
  String cod;
  double message;
  int cnt;
  List<Forecast> forecasts;

  WeatherForecast({this.city, this.cod, this.message, this.cnt, this.forecasts});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      forecasts = new List<Forecast>();
      json['list'].forEach((v) {
        forecasts.add(new Forecast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.forecasts != null) {
      data['list'] = this.forecasts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;

  City(
      {this.id,
      this.name,
      this.coord,
      this.country,
      this.population,
      this.timezone});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    data['country'] = this.country;
    data['population'] = this.population;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Coord {
  double lon;
  double lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}

class Forecast {
  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  var pressure;
  var humidity;
  List<Weather> weather;
  var speed;
  var deg;
  var clouds;
  var pop;

  Forecast(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.weather,
      this.speed,
      this.deg,
      this.clouds,
      this.pop});

  Forecast.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? new FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    clouds = json['clouds'];
    pop = json['pop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    if (this.temp != null) {
      data['temp'] = this.temp.toJson();
    }
    if (this.feelsLike != null) {
      data['feels_like'] = this.feelsLike.toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['clouds'] = this.clouds;
    data['pop'] = this.pop;
    return data;
  }
}

class Temp {
  var day;
  var min;
  var max;
  var night;
  var eve;
  var morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class FeelsLike {
  double day;
  double night;
  double eve;
  double morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({this.id = 0, this.main = "", this.description = "", this.icon = ""});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    String iconId = json['icon'];
    icon = _getIconUrl(iconId);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }

  String _getIconUrl(String iconId){
    return "http://openweathermap.org/img/wn/${iconId}@2x.png";
  }
}
