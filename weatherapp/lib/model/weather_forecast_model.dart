import 'dart:convert';

import 'package:collection/collection.dart';

class Weatherforecastmodel {
  String cod;
  int message;
  int cnt;
  List<Lista> list;
  City city;
  Weatherforecastmodel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  Weatherforecastmodel copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<Lista>? list,
    City? city,
  }) {
    return Weatherforecastmodel(
      cod: cod ?? this.cod,
      message: message ?? this.message,
      cnt: cnt ?? this.cnt,
      list: list ?? this.list,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'message': message,
      'cnt': cnt,
      'list': list.map((x) => x.toMap()).toList(),
      'city': city.toMap(),
    };
  }

  factory Weatherforecastmodel.fromMap(Map<String, dynamic> map) {
    return Weatherforecastmodel(
      cod: map['cod'] ?? '',
      message: map['message']?.toInt() ?? 0,
      cnt: map['cnt']?.toInt() ?? 0,
      list: List<Lista>.from(map['list']?.map((x) => Lista.fromMap(x))),
      city: City.fromMap(map['city']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weatherforecastmodel.fromJson(String source) =>
      Weatherforecastmodel.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'Weatherforecastmodel(cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Weatherforecastmodel &&
        other.cod == cod &&
        other.message == message &&
        other.cnt == cnt &&
        listEquals(other.list, list) &&
        other.city == city;
  }

  @override
  int get hashCode {
    return cod.hashCode ^
        message.hashCode ^
        cnt.hashCode ^
        list.hashCode ^
        city.hashCode;
  }
}

class Lista {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  dynamic pop;
  Sys sys;
  String dtTxt;

  Lista({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,

  });

  Lista copyWith({
    int? dt,
    Main? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    dynamic? pop,
    Sys? sys,
    String? dtTxt,

  }) {
    return Lista(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      sys: sys ?? this.sys,
      dtTxt: dtTxt ?? this.dtTxt,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dt': dt,
      'main': main.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'clouds': clouds.toMap(),
      'wind': wind.toMap(),
      'visibility': visibility,
      'pop': pop,
      'sys': sys.toMap(),
      'dtTxt': dtTxt,

    };
  }

  factory Lista.fromMap(Map<String, dynamic> map) {
    return Lista(
      dt: map['dt']?.toInt() ?? 0,
      main: Main.fromMap(map['main']),
      weather:
          List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
      clouds: Clouds.fromMap(map['clouds']),
      wind: Wind.fromMap(map['wind']),
      visibility: map['visibility']?.toInt() ?? 0,
      pop: map['pop'] ?? null,
      sys: Sys.fromMap(map['sys']),
      dtTxt: map['dtTxt'] ?? '',

    );
  }

  String toJson() => json.encode(toMap());

  factory Lista.fromJson(String source) => Lista.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Lista(dt: $dt, main: $main, weather: $weather, clouds: $clouds, wind: $wind, visibility: $visibility, pop: $pop, sys: $sys, dtTxt: $dtTxt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Lista &&
        other.dt == dt &&
        other.main == main &&
        listEquals(other.weather, weather) &&
        other.clouds == clouds &&
        other.wind == wind &&
        other.visibility == visibility &&
        other.pop == pop &&
        other.sys == sys &&
        other.dtTxt == dtTxt ;

  }

  @override
  int get hashCode {
    return dt.hashCode ^
        main.hashCode ^
        weather.hashCode ^
        clouds.hashCode ^
        wind.hashCode ^
        visibility.hashCode ^
        pop.hashCode ^
        sys.hashCode ^
        dtTxt.hashCode ;

  }
}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  int pressure;
  int seaLevel;
  int grndLevel;
  int humidity;
  dynamic tempKf;
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  Main copyWith({
    dynamic? temp,
    dynamic? feelsLike,
    dynamic? tempMin,
    dynamic? tempMax,
    int? pressure,
    int? seaLevel,
    int? grndLevel,
    int? humidity,
    dynamic tempKf,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
      humidity: humidity ?? this.humidity,
      tempKf: tempKf ?? this.tempKf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'seaLevel': seaLevel,
      'grndLevel': grndLevel,
      'humidity': humidity,
      'tempKf': tempKf,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] ?? null,
      feelsLike: map['feelsLike'] ?? null,
      tempMin: map['tempMin'] ?? null,
      tempMax: map['tempMax'] ?? null,
      pressure: map['pressure']?.toInt() ?? 0,
      seaLevel: map['seaLevel']?.toInt() ?? 0,
      grndLevel: map['grndLevel']?.toInt() ?? 0,
      humidity: map['humidity']?.toInt() ?? 0,
      tempKf: map['tempKf'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, seaLevel: $seaLevel, grndLevel: $grndLevel, humidity: $humidity, tempKf: $tempKf)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Main &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.seaLevel == seaLevel &&
        other.grndLevel == grndLevel &&
        other.humidity == humidity &&
        other.tempKf == tempKf;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        seaLevel.hashCode ^
        grndLevel.hashCode ^
        humidity.hashCode ^
        tempKf.hashCode;
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id']?.toInt() ?? 0,
      main: map['main'] ?? '',
      description: map['description'] ?? '',
      icon: map['icon'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather &&
        other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}

class Clouds {
  int all;
  Clouds({
    required this.all,
  });

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'all': all,
    };
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) => Clouds.fromMap(json.decode(source));

  @override
  String toString() => 'Clouds(all: $all)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Clouds && other.all == all;
  }

  @override
  int get hashCode => all.hashCode;
}

class Wind {
  double speed;
  int deg;
  Wind({
    required this.speed,
    required this.deg,
  });

  Wind copyWith({
    double? speed,
    int? deg,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'speed': speed,
      'deg': deg,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed']?.toDouble() ?? 0.0,
      deg: map['deg']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wind && other.speed == speed && other.deg == deg;
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode;
}

class Sys {
  String pod;
  Sys({
    required this.pod,
  });

  Sys copyWith({
    String? pod,
  }) {
    return Sys(
      pod: pod ?? this.pod,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pod': pod,
    };
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      pod: map['pod'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) => Sys.fromMap(json.decode(source));

  @override
  String toString() => 'Sys(pod: $pod)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sys && other.pod == pod;
  }

  @override
  int get hashCode => pod.hashCode;
}


class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  City copyWith({
    int? id,
    String? name,
    Coord? coord,
    String? country,
    int? population,
    int? timezone,
    int? sunrise,
    int? sunset,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
      coord: coord ?? this.coord,
      country: country ?? this.country,
      population: population ?? this.population,
      timezone: timezone ?? this.timezone,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'coord': coord.toMap(),
      'country': country,
      'population': population,
      'timezone': timezone,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      coord: Coord.fromMap(map['coord']),
      country: map['country'] ?? '',
      population: map['population']?.toInt() ?? 0,
      timezone: map['timezone']?.toInt() ?? 0,
      sunrise: map['sunrise']?.toInt() ?? 0,
      sunset: map['sunset']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromMap(json.decode(source));

  @override
  String toString() {
    return 'City(id: $id, name: $name, coord: $coord, country: $country, population: $population, timezone: $timezone, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is City &&
        other.id == id &&
        other.name == name &&
        other.coord == coord &&
        other.country == country &&
        other.population == population &&
        other.timezone == timezone &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        coord.hashCode ^
        country.hashCode ^
        population.hashCode ^
        timezone.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }
}

class Coord {
  double lat;
  double lon;
  Coord({
    required this.lat,
    required this.lon,
  });

  Coord copyWith({
    double? lat,
    double? lon,
  }) {
    return Coord(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lat: map['lat']?.toDouble() ?? 0.0,
      lon: map['lon']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) => Coord.fromMap(json.decode(source));

  @override
  String toString() => 'Coord(lat: $lat, lon: $lon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coord && other.lat == lat && other.lon == lon;
  }

  @override
  int get hashCode => lat.hashCode ^ lon.hashCode;
}
