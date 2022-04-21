import 'dart:convert';
import 'package:http/http.dart' as http;
import 'DBHelper.dart';

import 'DBOperation.dart';
import 'model/Bitcoin.dart';
class ApiCall{
  final String url = "https://api.coingecko.com/api/v3/coins/bitcoin";
  Future getBitcoin() async{

    var response= await http.get(Uri.parse(url));
    var body=response.body;
    var bitcoin=   Bitcoin.fromJson(jsonDecode(body));
  //  print('bitcon-${bitcoin.categories}');
  //  print('bitcon-${bitcoin.image.small}');

   // DBOperation().insertBitcoin(bitcoin);



  }


}