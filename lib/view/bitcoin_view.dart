

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangement_provider/model/Bitcoin.dart';
import 'package:state_mangement_provider/repo/api_services.dart';
import 'package:state_mangement_provider/view_models/bitcoins_view_model.dart';

class BitcoinView extends StatefulWidget {
  const BitcoinView({Key? key}) : super(key: key);




  @override
  _BitcoinViewState createState() => _BitcoinViewState();
}

class _BitcoinViewState extends State<BitcoinView> {
  BitcoinModelView bitcoinModelView=BitcoinModelView();
  String? id;
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<BitcoinModelView>(create: (context) {
      return BitcoinModelView();
    }, child: Consumer<BitcoinModelView>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(''),
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                provider.loading? Text('No data found'):Text(provider.bitcoinListModel[0].image.small)
                ],
              )),
        );
      },
    ));
  }

  @override
  void initState() {

  //  bitcoinModelView.getBitcoin();
    super.initState();
  }
}
