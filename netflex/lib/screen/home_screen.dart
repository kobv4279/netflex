import 'package:flutter/material.dart';
import 'package:netflex/model/model_movie.dart';
import 'package:netflex/widget/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
  
  }
  
  //homescreen에대한 상태관리
class _HomeScreenState extends State<HomeScreen> {
  //영화 더미 데이터
  //그냥 set형태로 관리해도되지만 굳이 Movie모델로 선언하여 더미데이터를 만드는 이유는
  //추후에 파이어베이스 연동에서 실제로 가져오는 데이터를 그대로 처리하기 위함
  List<Movie> movies = [
    Movie.fromMap(
      {
        'title': '사랑의 깜수니',
        'keyword': '사랑/로맨스/판타지',
        'poster': 'kam.jpg',
        'like': false
      }
    )
    
  ];


  @override 
  void initState(){
    super.initState();
  }

//HomeScreen에서 기존 TopBar()를 지우고 ListView안에Stack을 넣는 구조로 수정합니다 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(children: <Widget>[
      Stack(children: <Widget>[
        CarouselImage(movies: movies),
        TopBar(),
      ],
      ),
    ],
    );
}

}
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        //간격
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Image.asset(
          'images/kam.jpeg', 
          fit: BoxFit.contain, 
          height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right:1),
            child: Text(
              'tv프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right:1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),

          Container(
            padding: EdgeInsets.only(right:1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: FlatButton(
              color: Colors.white,
              onPressed: (){},
              child: Row(
                children: <Widget>[
                  Icon(Icons.play_arrow,
                  color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.all(3),
                  ),
                  Text(
                    '재생',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: (){},
                ),
                Text(
                  '정보',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          )
      ],),

    );

  }

}