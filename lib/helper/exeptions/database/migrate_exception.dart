class TableMigrationException implements Exception {
  String message;

  TableMigrationException(this.message);
}