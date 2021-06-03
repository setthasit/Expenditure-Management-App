class TextValidator {
  validateRequired(String name, String? val) {
    if (val == null || val.isEmpty) {
      return '$name is required';
    }
    return null;
  }
}