abstract class Entity {
  String tableName = "";

  // toMap - turn class object to map usually use with DAO
  Map<String, dynamic> toMap() {
    return {};
  }

  String toMigrateString() {
    return "";
  }
}