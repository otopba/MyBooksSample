extension StringNullEx on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? true;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isNullOrBlank => this?.trim().isEmpty ?? true;
}

extension StringEx on String {
  String toUpperCaseFirstLetter() {
    if (isEmpty) return this;

    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
