import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangement_provider/ApiCall.dart';
import 'package:state_mangement_provider/utils/shared_pref.dart';
import 'DBOperation.dart';
import 'HomePageProvider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(create: (context) {
      return HomePageProvider();
    }, child: Consumer<HomePageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Age',
                      hintText: 'Enter Age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      provider.getAge(int.parse(value));
                     // SharedPref.addStringToSF(value);

                    }
                  },
                ),
              ),
              Text(provider.eligiable!),
              StreamBuilder(
                stream: provider.controller.stream,
                  builder:(context,snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data.toString());
                  }
                  return const Text('no prefernce');
                  } ),

              ElevatedButton(onPressed: (){
                DBOperation().fetchBitcoin().then((value){
                  setState(() {
                    print("fff-$value");
                  });
                });
              }, child: Text('getlocalData'))
            ],
          )),
        );
      },
    ));
  }

  @override
  void initState() {
  //  ApiCall().getBitcoin();
  var  user_age=  SharedPref().getIntValuesSF('intValue').then((value){
    print("initState stram value -${value.toString()}");
  });



    super.initState();
  }
  @override
  void dispose() {
    HomePageProvider().controller.close();
    super.dispose();
  }
}
