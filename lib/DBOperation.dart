import 'package:flutter/material.dart';
import 'DBHelper.dart';
import 'model/Bitcoin.dart';

class DBOperation {
 /* void insertBitcoin(Bitcoin bitcoin) {
  var item=  bitcoin.toJson();
  var image_item=item['image'];
  item['id'] = id;
  item['categories'] = categories;
  item['image'] = image;

    DBHelper.insert('bitcoin', {
      'uid':DateTime.now().toString(),
      'id': bitcoin.id,
      'categories': item['categories'],
      'image': item['image'],
    });
  }*/

  Future<List<Bitcoin>> fetchBitcoin() async {
    var bitcoinList = await DBHelper.getData('bitcoin');

    List<Bitcoin> item = [];

    bitcoinList.map((dynamic value) {
      item.add(value);
    }).toList();

    return item;
  }

/*
    return bitcoinList.map((dynamic item) {
      Bitcoin(
          id: item['id'], categories: item['categories'], image: item['image']);
    })
        .toList();
*/

}
