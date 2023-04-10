import 'dart:io';

import 'package:yaml/yaml.dart';

/// Setting function
class Config {
  String key;
  String address;
  int price;
  num intervals;
  String host;
  String api;
  String protocal;
  Config(
      {required this.key,
      required this.address,
      required this.price,
      required this.intervals,
      required this.host,
      required this.api,
      required this.protocal});

  static Future<Config?> create() async {
    //load configuration
    var path = "./config.yaml";
    var cfg;
    File file = File(path);
    if ((await file.exists()) == true) {
      String content = await file.readAsString();
      cfg = loadYaml(content);
    }
    if (cfg == null) {
      return null;
    }
//validate time intervals
    int intervalConfig = cfg["intervals"];
    if (intervalConfig < 1 || intervalConfig > 60) {
      intervalConfig = 30;
    }
    return Config(
        key: cfg["key"],
        address: cfg["address"],
        price: cfg["price"],
        intervals: intervalConfig,
        host: cfg["host"],
        api: cfg["api"],
        protocal: cfg["protocal"]);
  }
}
