import 'package:massa/massa.dart';

class Autostake {
  late Wallet wallet;
  late String address;
  final String secretKey;
  final int price;
  final String host;
  final String api;
  final String protocal;
  Autostake(this.secretKey, this.address, this.price, this.host, this.api,
      this.protocal) {
    Uri uri = Uri.https(host, api);
    if (protocal == "http") {
      uri = Uri.http(host, api);
    }
    wallet = Wallet(uri);
    wallet.addAccountFromSecretKey(secretKey, AddressType.user);
  }
  Future<void> stake() async {
    //check balance
    var balance = await wallet.getAccountBalance(address);
    print(balance.toString());
    var totolBalance = balance.candidateBalance > balance.finalBalance
        ? balance.candidateBalance
        : balance.finalBalance;
    int rollCount = totolBalance ~/ price;
    if (rollCount > 0) {
      var output = await wallet.buyRolls(address, rollCount);
      print('buying $rollCount roll(s): $output');
    } else {
      print('insufficient balance to buy rolls');
    }
  }
}
