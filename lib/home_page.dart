

import 'dart:convert';

import 'package:api_example_263/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DataModel? mData;

  @override
  void initState() {
    super.initState();
    getQuotes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
      ),
      body: mData!=null ? ListView.builder(
        itemCount: mData!.quotes.length,
          itemBuilder: (_, index){
        return Card(
          elevation: 11,
          margin: EdgeInsets.all(11),
          child: ListTile(
            title: Text('${mData!.quotes[index].quote}'),
            subtitle: Text('${mData!.quotes[index].author}'),
          ),
        );
      }) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void getQuotes() async {

    Uri mApi = Uri.parse('https://dummyjson.com/quotes');

    var res = await httpClient.get(mApi);

    if(res.statusCode==200){
      dynamic actualData = jsonDecode(res.body);
      mData = DataModel.fromJson(actualData);
      setState(() {

      });
    }



  }
}
