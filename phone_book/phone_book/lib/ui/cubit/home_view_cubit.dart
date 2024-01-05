import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/data/entity/persons.dart';
import 'package:phone_book/data/repo/persons_dao_repo.dart';

class HomeViewCubit extends Cubit<List<Persons>> {
  HomeViewCubit() : super(<Persons>[]);

  var prepo = PersonsDaoRepo();

  Future<void> uploadPersons() async {
    var persons = await prepo.uploadPersons();
    emit(persons);
  }

  Future<void> search(String searchWord) async {
    var persons = await prepo.search(searchWord);
    emit(persons);
  }

  Future<void> deletePerson(int id) async {
    await prepo.deletePerson(id);
    await prepo.uploadPersons();
  }
}
