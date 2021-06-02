class DatabaseOperationFailException implements Exception {
  String message;

  DatabaseOperationFailException(this.message);
}