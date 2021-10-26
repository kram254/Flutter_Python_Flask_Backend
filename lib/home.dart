import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:python_simple_api/function.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String output = 'Initial Output';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flask Sample App"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value){
                  url= 'http://10.0.2.2:5000/api?query=' + value.toString();
                  
                },
              ),
              TextButton(
                onPressed: () async
                {
                  data =  await fetchdata(url);
                  var decoded = jsonDecode(data);
                  setState(() {
                    output = decoded['output'];
                  });
                }, 
                child: Text('Fetch ASCII Value',
                style: TextStyle(color: Colors.blueGrey, fontSize: 23.0,),
                ),
                ),
              Text(output,
                style: TextStyle(color: Colors.green, fontSize: 35.0,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}