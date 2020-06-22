
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflex/model/model_movie.dart';
import 'package:netflex/screen/detail_screen.dart';



class CarouselImage extends StatefulWidget{
  final List<Movie> movies;
  CarouselImage({this.movies});    //생성자를통해 movie를 가져옴
  _CarouselImageState createState() => _CarouselImageState();

}
  
class _CarouselImageState extends State<CarouselImage> {
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
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
               },
              ),
            ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                          ? IconButton(
                        icon: Icon(Icons.check), onPressed: () {},)
                          : IconButton(
                        icon: Icon(Icons.add), onPressed: () {},),
                      Text(
                        '내가 찜한 콘텐츠 ',
                        style: TextStyle(fontSize: 11),),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.play_arrow, color: Colors.black,),
                        Padding(padding: EdgeInsets.all(3),),
                        Text('재생', style: TextStyle(color: Colors.black),),
                      ],
                    ),),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              return DetailScreen(
                                movie: movies[_currentPage],
                              );
                            }
                          ));
                        },
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          ),
        ],
      ),
    );
  }
}
  List<Widget> makeIndicator(List list, int _currentPage){
    List<Widget> results = [];
    for (var i = 0; i< list.length; i++){
      results.add(Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i
            ? Color.fromRGBO(255, 255, 255, 0.9)
            : Color.fromRGBO(255, 255, 255, 0.4),
        ),
      ));
    }

    return results;
  }


