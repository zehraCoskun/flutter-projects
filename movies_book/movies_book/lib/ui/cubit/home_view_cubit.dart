import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_book/data/entity/movies.dart';
import 'package:movies_book/data/repo/movie_dao_repo.dart';

class HomeViewCubit extends Cubit<List<Movies>> {
  HomeViewCubit() : super(<Movies>[]);
  var mrepo = MoviewDaoRepo();

  Future<void> uploadMovies() async {
    var list = await mrepo.uploadMovies();
    emit(list);
  }
}
