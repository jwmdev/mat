import 'package:autostake/autostake.dart';
import 'package:autostake/config.dart';
import 'package:cron/cron.dart';

Future<void> main(List<String> arguments) async {
  var config = await Config.create();
  if (config != null) {
    print("Massa autostake has started!");
    print("staking address: ${config.address}");
    //print("node key: ${config.node.key}");
    print("node staking interval: ${config.intervals}");

    final autostake = Autostake(
        config.key, config.address, config.price, config.host, config.api, config.protocal);
    var cronTime = getCronTime(config.intervals as int);
    print("cron time is: $cronTime");

    //cron job
    final cron = Cron();
    cron.schedule(Schedule.parse(cronTime), () async {
      await autostake.stake();
    });
  }
}

String getCronTime(int minutes) {
  return "*/$minutes * * * *";
}
