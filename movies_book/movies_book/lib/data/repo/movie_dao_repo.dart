import 'package:movies_book/data/entity/movies.dart';
import 'package:movies_book/data/sqlite/database_util.dart';

class MoviewDaoRepo {

 
  //   var m5 = Movies(id: 5, name: "The Pianist", image: "thepianist.png", price: 18);
  //   var m6 = Movies(id: 6, name: "Anadoluda", image: "anadoluda.png", price: 10);
  // }

  Future<List<Movies>> uploadMovies() async {
    var db = await DatabaseUtil.databaseAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM MOVIES");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Movies(id: line["movie_id"], name: line["movie_name"], image: line["movie_image"], price: line["movie_price"]);
    });
  }
}
