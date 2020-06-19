import 'package:flutter/material.dart';
import 'package:netflex/screen/home_screen.dart';
import 'package:netflex/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

//MyApp에대한 상태 관리 
  _MyAppState createState() => _MyAppState();
  
  }
  
class _MyAppState extends State<MyApp> {
  TabController controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //네비게이션전에 MaterialApp설정해주기

    return MaterialApp(
      title: 'BbongFix',
      theme: ThemeData(
        brightness: Brightness.dark, 
        primaryColor: Colors.black, 
        accentColor: Colors.white,
      ),


//4개의 탭으로 구성할거니까length 4로
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(), //사용자가 직접 손가락모션을 통해서
            children: <Widget> [
              HomeScreen(),
              Container(
                child: Center(
                  child: Text('home'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('search'),
                  ),
                ),
              Container(
                child: Center(
                  child: Text('save'),
                  ),
              ),
              Container(
                child: Center(
                  child: Text('more'),
                ),
              ),
            ],   
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}