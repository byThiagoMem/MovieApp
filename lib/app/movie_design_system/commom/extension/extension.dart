extension StringExtension on String {
  String get originalImage {
    return 'https://image.tmdb.org/t/p/original$this';
  }
}
