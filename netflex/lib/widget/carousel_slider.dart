
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflex/model/model_movie.dart';



class CarouselImage extends StatefulWidget{
  final List<Movie> movies;
  CarouselImage({this.movies});    //생성자를통해 movie를 가져옴
  _CarouselImageState createState() => _CarouselImageState();
    
    
}
  
class _CarouselImageState extends State<CarouselImage>{

  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;


//CarouselImage에서 어느위치에 있는지 index를 저장할 _currentPage를 만듬
  int _currentPage = 0;
  String _currentKeyword;


//initState()에서는 사우이클래스인 StatefulWidget 에서 가져온 movies를 참조할 수있도록 값을 가져옴
  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
//map을 통해 movies로 부터 원하는 값들만 모아 리스트 형태로 만들수 있다
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),

          ),
          CarouselSlider(
            items: images,
            // carouselController: ,
            // onPageChanged: (index){
            //   setState((){
            //     _currentPage = index;
            //     _currentKeyword = keywords[_currentPage];
            //   });
            // }, 
            options: null,
            ),
          Container(
            child: Text(_currentKeyword),
            ),
        ],
      ),


    );
  }

    
}

