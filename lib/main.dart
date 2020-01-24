import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shrofile_login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shrofile",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
          accentColor: Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  SharedPreferences sharedPreferences;
  //Future<Post> post;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    //post = fetchPost();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
    else
    {
      print("if token is not null");
    }
  }
//String url=jsonResponse['response']['image_url'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shrofile", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              //sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Text("Log Out", style: TextStyle(color: Colors.white)),
          ),
        ],


      ),
      //body: Center(child: Text("Main Page"),
      body:


      Center(

        /*child: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(" running");
              return Text(snapshot.data.firstName);
            } else if (snapshot.hasError) {
              print("not running");
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
        */



         //child: Text(jsonResponse['response']['lastName']),



      ),


      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              //height: 140,

              //child: Text('Hello ${jsonResponse['response']['firstName']}'),
              child: Image.network("${jsonResponse['response']['image_url']}"),

              
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
            ),
            ListTile(
              title: Text('Hello ${jsonResponse['response']['firstName']}'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Email:  ${jsonResponse['response']['email']}'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Destination: ${jsonResponse['response']['basicInfo']['summary']}"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Gender : ${jsonResponse['response']['gender']}"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text("Location : ${jsonResponse['response']['basicInfo']['location']}"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}