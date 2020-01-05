import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/model/movie.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovie();

  final List movie = [
    "The ",
    "bsc",
    "cjisdn",
    "dubdci",
    "sdjnc",
    "kuchbd",
    "wejhnc",
    "ejhnuc",
    "snc",
    "adlcn",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                movieCard(movieList[index], context),
                Positioned(
                    top: 10.0,
                    child: movieImage(movieList[index].image[0])),
              ],
            );
//            return Card(
//              elevation: 8.0,
//              color: Colors.white,
//              child: ListTile(
//                leading: CircleAvatar(
//                  child: Container(
//                    width: 200,
//                    height: 200,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(13.9),
//                      image: DecorationImage(
//                        image: NetworkImage(movieList[index].image[0]),
//                        fit: BoxFit.cover,
//                      )
//                    ),
//                    child: null,
//                  ),
//                ),
//                trailing: Text("---"),
//                title: Text(movieList[index].title),
//                subtitle: Text("${movieList[0].title}"),
////            onTap: ()=> debugPrint("Movie name ${movie[index]}"),
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => MovieListViewDetails(movieName: movieList[index].title,
//                          movie: movieList[index],
//                          )));
//                },
//              ),
//            );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 48.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding:
                EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(child: Text(movie.title)),
                    Text("Rating ${movie.imdbrating}/10"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Released ${movie.released}"),
                    Text(movie.runtime),
                    Text(movie.rated),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      movie: movie,
                    )))
      },
    );
  }

  Widget movieImage(String imageURl) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageURl ?? 'https://picsum.photos/200/300'),
              fit: BoxFit.cover)),
    );
  }
}

//New route
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          child: Text("GO back  ${this.movie.director}"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
