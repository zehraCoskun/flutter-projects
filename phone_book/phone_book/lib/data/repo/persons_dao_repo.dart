import 'package:phone_book/data/entity/persons.dart';
import 'package:phone_book/data/sqlite/database_util.dart';

class PersonsDaoRepo {
  Future<void> saved(String name, String phone) async {
    var db = await DatabaseUtil.databaseAccess();
    var newPerson = Map<String, dynamic>();
    newPerson["person_name"] = name;
    newPerson["person_phone"] = phone;
    await db.insert("contacts", newPerson);
  }

  Future<void> updated(int id, String name, String phone) async {
    var db = await DatabaseUtil.databaseAccess();
    var updatedPerson = Map<String, dynamic>();
    updatedPerson["person_name"] = name;
    updatedPerson["person_phone"] = phone;
    await db.update("contacts", updatedPerson, where: "person_id = ?", whereArgs: [id]);
  }

  Future<void> deletePerson(int id) async {
    var db = await DatabaseUtil.databaseAccess();
    await db.delete("contacts", where: "person_id = ?", whereArgs: [id]);
  }

  Future<List<Persons>> uploadPersons() async {
    var db = await DatabaseUtil.databaseAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM contacts");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Persons(id: line["person_id"], name: line["person_name"], number: line["person_phone"]);
    });
  }

  Future<List<Persons>> search(String searchWord) async {
    var db = await DatabaseUtil.databaseAccess();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM contacts WHERE person_name like '%$searchWord%' ");
    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Persons(id: line["person_id"], name: line["person_name"], number: line["person_phone"]);
    });
  }
}
