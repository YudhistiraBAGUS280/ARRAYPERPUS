class Perpus  {
  int id;
  String title;
  double? voteAverage;
  String posterPath;
  String Penerbit;
  String Penulis;
  double? TahunTerbit;
  
  double imageWidth; // tambahkan properti ini
  double imageHeight; // tambahkan properti ini

  Perpus({
    required this.id,
    required this.title,
    this.voteAverage,
    required this.Penerbit,
    
    required this.Penulis,
    this.TahunTerbit,
    required this.posterPath,
     required this.imageWidth, // tambahkan parameter ini
    required this.imageHeight, // tambahkan parameter ini
  });
}