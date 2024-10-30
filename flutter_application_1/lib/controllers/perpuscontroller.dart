import 'package:flutter_application_1/models/perpus.dart';
import 'package:flutter_application_1/models/perpus.dart';

class Perpuscontroller {
  List<Perpus> perpus = [
    Perpus(
      id: 1,
      title: "Abu Nawas",
      voteAverage: 8,
      posterPath: 'asset/abu nawas.jpg',
      Penerbit: "Gramedia Pustaka Utama",
      Penulis: "Mahmud Muhammad Said Al-Shahirji",
      TahunTerbit:2008 ,
      
      imageWidth: 100, // tambahkan nilai ini
      imageHeight: 150, // tambahkan nilai ini
    ),
    Perpus(
      id: 2,
      title: "spongebob",
      voteAverage: 4,
      posterPath: 'asset/spongebob.jpg',
      Penerbit: "Gramedia Pustaka Utama",
        Penulis: "Stephen Hillenburg",
          TahunTerbit:2009 ,
      imageWidth: 200, // tambahkan nilai ini
      imageHeight: 180, // tambahkan nilai ini
    ),
    Perpus(
      id: 2,
      title: "kerajaan Kediri",
      voteAverage: 2,

      posterPath: 'asset/kerjaan kediri.jpg',
        Penulis: "Kak Oky",
          TahunTerbit:2011 ,
      
       Penerbit: "Gramedia Pustaka Utama",
      imageWidth: 200 , // tambahkan nilai ini
      imageHeight: 400, // tambahkan nilai ini
    )
  ];
}