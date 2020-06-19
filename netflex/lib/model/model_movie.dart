

//영화모델을 만든이유는 이후에 들어갈 데이터 관리가 쉽게하기위함
class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;


  Movie.fromMap(Map<String, dynamic> map)
  : title = map['title'],
    keyword = map['keyword'],
    poster = map['poster'],
    like = map['liket'];


//해당 클래스를 프린트할때 용이하게 하기 위해서 toString() ㅁㅔ소드 오버라이드
@override
String toString() => "Movie<$title:$keyword>";
}

 