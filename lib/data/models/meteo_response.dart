class MeteoResponse {
  CityInfo? cityInfo;
  ForecastInfo? forecastInfo;
  CurrentCondition? currentCondition;

  MeteoResponse({this.cityInfo, this.forecastInfo, this.currentCondition});

  MeteoResponse.fromJson(Map<String, dynamic> json) {
    cityInfo = json['city_info'] != null
        ? new CityInfo.fromJson(json['city_info'])
        : null;
    forecastInfo = json['forecast_info'] != null
        ? new ForecastInfo.fromJson(json['forecast_info'])
        : null;
    currentCondition = json['current_condition'] != null
        ? new CurrentCondition.fromJson(json['current_condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cityInfo != null) {
      data['city_info'] = this.cityInfo!.toJson();
    }
    if (this.forecastInfo != null) {
      data['forecast_info'] = this.forecastInfo!.toJson();
    }
    if (this.currentCondition != null) {
      data['current_condition'] = this.currentCondition!.toJson();
    }
    return data;
  }
}

class CityInfo {
  String? name;
  String? country;
  String? latitude;
  String? longitude;
  String? elevation;
  String? sunrise;
  String? sunset;

  CityInfo(
      {this.name,
        this.country,
        this.latitude,
        this.longitude,
        this.elevation,
        this.sunrise,
        this.sunset});

  CityInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    elevation = json['elevation'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['elevation'] = this.elevation;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}

class ForecastInfo {
  String? latitude;
  String? longitude;
  String? elevation;

  ForecastInfo({this.latitude, this.longitude, this.elevation});

  ForecastInfo.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    elevation = json['elevation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['elevation'] = this.elevation;
    return data;
  }
}

class CurrentCondition {
  String? date;
  String? hour;
  int? tmp;
  int? wndSpd;
  int? wndGust;
  String? wndDir;
  double? pressure;
  int? humidity;
  String? condition;
  String? conditionKey;
  String? icon;
  String? iconBig;

  CurrentCondition(
      {this.date,
        this.hour,
        this.tmp,
        this.wndSpd,
        this.wndGust,
        this.wndDir,
        this.pressure,
        this.humidity,
        this.condition,
        this.conditionKey,
        this.icon,
        this.iconBig});

  CurrentCondition.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    hour = json['hour'];
    tmp = json['tmp'];
    wndSpd = json['wnd_spd'];
    wndGust = json['wnd_gust'];
    wndDir = json['wnd_dir'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    condition = json['condition'];
    conditionKey = json['condition_key'];
    icon = json['icon'];
    iconBig = json['icon_big'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['hour'] = this.hour;
    data['tmp'] = this.tmp;
    data['wnd_spd'] = this.wndSpd;
    data['wnd_gust'] = this.wndGust;
    data['wnd_dir'] = this.wndDir;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    data['condition'] = this.condition;
    data['condition_key'] = this.conditionKey;
    data['icon'] = this.icon;
    data['icon_big'] = this.iconBig;
    return data;
  }
}
