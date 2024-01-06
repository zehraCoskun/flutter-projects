import 'package:phone_book/data/entity/persons.dart';
import 'package:phone_book/data/sqlite/database_util.dart';

class PersonsDaoRepo {
  Future<void> saved(String name, String phone) async {
    print("$name - $phone");
  }

  Future<void> updated(int id, String name, String phone) async {
    print("$name - $phone");
  }

  Future<void> deletePerson(int id) async {
    print("$id");
  }

  Future<List<Persons>> uploadPersons() async {
    var db = await DatabaseUtil.databaseAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM PERSON");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Persons(id: line["person_id"], name: line["person_name"], number: line["person_number"]);
    });
  }

  Future<List<Persons>> search(String searchWord) async {
    var p1 = Persons(id: 1, name: "zehra", number: "1234");
    var persons = [p1];
    return persons;
  }
}
