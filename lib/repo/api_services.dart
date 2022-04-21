import 'dart:io';

import 'package:state_mangement_provider/model/Bitcoin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:state_mangement_provider/utils/constant.dart';
import 'package:state_mangement_provider/utils/status.dart';

class ApiServices {
  /*Future<List<Bitcoin>> getBitcoin() async {
    List<Bitcoin> bitcoin_list = [];
    try {
      var response = await http.get(Uri.parse(URL));
      if (response.statusCode == 200) {
        var body = response.body;
        var bitcoin = Bitcoin.fromJson(jsonDecode(body));
        bitcoin_list.add(bitcoin);
      }
      return bitcoin_list;
    } catch (e) {
      throw "Unable to retrieve $e.";
    }
  }*/

   Future<List<Bitcoin>> getBitcoin() async {
    List<Bitcoin> bitcoin_list = [];
    try {
      var response = await http
          .get(Uri.parse(URL));
      if (response.statusCode == 200) {
        var body = response.body;
        var bitcoin = Bitcoin.fromJson(jsonDecode(body));
        bitcoin_list.add(bitcoin);
      }
      return bitcoin_list;
    } on HttpException {
      throw "Unable to retrieve HttpException.";
    } on SocketException {
      throw "Unable to retrieve SocketException.";
    } on FormatException {
      throw "Unable to retrieve FormatException.";;
    } catch (e) {
      throw "Unable to retrieve $e.";
    }
  }
}
