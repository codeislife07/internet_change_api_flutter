import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internet_change_flutter/service/api_service.dart';

import 'model/game_model.dart';

void main() {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: NoInternetScreen(),
      home: const MyHomePage(title: 'Connection Check with Api'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool load = true;
  List<GameModel> games = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: (){
            loadApi();
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
          child: load
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: games.length,
                  itemBuilder: (BuildContext context, int index) {
                    var singleGame = games[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300]!
                        ),
                        child: ListTile(
                          leading: Container(
                              height: 100,width: 100,
                              child: Image.network(singleGame.thumb,fit: BoxFit.fill,),
                          ),
                          title: Text(singleGame.internalName),
                        ),
                      ),
                    );
                  },
                )),
    );
  }

  void loadApi() async {
    load = true;
    games.clear();
    setState(() {

    });
    var response = await ApiService().sendRequest(
        url: 'https://www.cheapshark.com/api/1.0/deals?upperPrice=1&page=1',
        method: "get");
    if (response.isNotEmpty) {
      games.addAll(gameModelFromJson(jsonEncode(response)));
    }
    load = false;
    setState(() {});
  }
}




//Thank you for watching
