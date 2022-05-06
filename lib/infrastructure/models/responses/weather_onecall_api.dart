// To parse this JSON data, do
//
//     final weatherOneCall = weatherOneCallFromJson(jsonString);

import 'dart:convert';

WeatherOneCall weatherOneCallFromJson(String str) => WeatherOneCall.fromJson(json.decode(str));

String weatherOneCallToJson(WeatherOneCall data) => json.encode(data.toJson());

class WeatherOneCall {
    WeatherOneCall({
        this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        this.current,
        this.hourly,
        this.daily,
    });

    double? lat;
    double? lon;
    String? timezone;
    int? timezoneOffset;
    Current? current;
    List<Current>? hourly;
    List<Daily>? daily;

    factory WeatherOneCall.fromJson(Map<String, dynamic> json) => WeatherOneCall(
        lat: json["lat"],
        lon: json["lon"],
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current: json["current"] != null ? Current.fromJson(json["current"]) : null,
        hourly: json["hourly"] != null ? List<Current>.from(json["hourly"].map((x) => Current.fromJson(x))) : [],
        daily: json["daily"] != null ? List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))) : [],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current!.toJson(),
        "hourly": List<dynamic>.from(hourly!.map((x) => x.toJson())),
        "daily": List<dynamic>.from(daily!.map((x) => x.toJson())),
    };
}

class Current {
    Current({
        this.dt,
        this.sunrise,
        this.sunset,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.uvi,
        this.clouds,
        this.visibility,
        this.windSpeed,
        this.windDeg,
        this.weather,
    });

    int? dt;
    int? sunrise;
    int? sunset;
    double? temp;
    double? feelsLike;
    int? pressure;
    int? humidity;
    double? dewPoint;
    double? uvi;
    int? clouds;
    int? visibility;
    double? windSpeed;
    int? windDeg;
    List<WeatherElement>? weather;

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"].toDouble(),
        feelsLike: json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        uvi: json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
    };
}

class WeatherElement {
    WeatherElement({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int? id;
    String? main;
    String? description;
    String? icon;

    factory WeatherElement.fromJson(Map<String, dynamic> json) => WeatherElement(
        id: json["id"],
        main:json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}


class Daily {
    Daily({
        this.dt,
        this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.moonPhase,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.windSpeed,
        this.windDeg,
        this.windGust,
        this.weather,
        this.clouds,
        this.uvi,
    });

    int? dt;
    int? sunrise;
    int? sunset;
    int? moonrise;
    int? moonset;
    double? moonPhase;
    Temp? temp;
    FeelsLike? feelsLike;
    int? pressure;
    int? humidity;
    double? dewPoint;
    double? windSpeed;
    int? windDeg;
    double? windGust;
    List<WeatherElement>? weather;
    int? clouds;
    double? uvi;

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"].toDouble(),
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"].toDouble(),
        windSpeed: json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"].toDouble(),
        weather: List<WeatherElement>.from(json["weather"].map((x) => WeatherElement.fromJson(x))),
        clouds: json["clouds"],
        uvi: json["uvi"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp!.toJson(),
        "feels_like": feelsLike!.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds,
        "uvi": uvi,
    };
}

class FeelsLike {
    FeelsLike({
        required this.day,
        required this.night,
        required this.eve,
        required this.morn,
    });

    double day;
    double night;
    double eve;
    double morn;

    factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class Temp {
    Temp({
        required this.day,
        required this.min,
        required this.max,
        required this.night,
        required this.eve,
        required this.morn,
    });

    double day;
    double min;
    double max;
    double night;
    double eve;
    double morn;

    factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
