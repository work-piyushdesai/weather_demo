extension StringExtension on String {
  bool isEmptyStringExtension() {
    return isEmpty;
  }

  bool isUrl() {
    if (!isEmptyStringExtension()) {
      return startsWith('http://') || startsWith('https://');
    }
    return false;
  }
}
