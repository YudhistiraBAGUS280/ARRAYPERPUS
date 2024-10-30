import 'package:flutter/material.dart'
    show
        AppBar,
        AssetImage,
        BuildContext,
        Card,
        Color,
        Colors,
        Column,
        EdgeInsets,
        ElevatedButton,
        Form,
        FormState,
        GlobalKey,
        Icon,
        IconButton,
        Icons,
        Image,
        InputDecoration,
        ListTile,
        ListView,
        Navigator,
        PopupMenuButton,
        PopupMenuItem,
        RoundedRectangleBorder,
        Scaffold,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        TextFormField,
        Widget;
import 'package:flutter/widgets.dart';

import 'package:flutter_application_1/controllers/perpuscontroller.dart';
import 'package:flutter_application_1/modal/modal.dart';

import 'package:flutter_application_1/models/perpus.dart';
import 'package:flutter_application_1/widgets/perpus_widget.dart';

class PerpusView extends StatefulWidget {
  PerpusView({super.key});

  @override
  State<PerpusView> createState() => _PerpusViewState();
}

class _PerpusViewState extends State<PerpusView> {
  Perpuscontroller movie = Perpuscontroller();
  TextEditingController titleInput = TextEditingController();
  TextEditingController gambarInput = TextEditingController();
  TextEditingController Penerbit = TextEditingController();
  TextEditingController Penulis = TextEditingController();
  TextEditingController TahunTerbit = TextEditingController();
  TextEditingController voteAverage = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ModalWidget modal = ModalWidget();

  List<String> listAct = ["Ubah", "Hapus"];
  List<Perpus>? film;
  int? film_id;
  getFilm() {
    setState(() {
      film = movie.perpus;
    });
  }

  addFilm(data) {
    film!.add(data);
    getFilm();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFilm();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pepustakaan"),
        backgroundColor: Color.fromARGB(255, 6, 70, 221),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                film_id = null;
              });
              titleInput.text = '';
              gambarInput.text = '';
              Penerbit.text = '';
              Penulis.text = '';
              TahunTerbit.text = '';
              voteAverage.text = '';

              modal.showFullModal(context, fromTambah(null));
            },
            icon: Icon(Icons.add_sharp),
          ),
        ],
      ),
      body: film != null
          ? ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: film!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(film![index].posterPath),
                              width: 100,
                              height: 150,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    film![index].title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Stok: ${film![index].voteAverage.toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  Text(
                                    "Penerbit: ${film![index].Penerbit.toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  Text(
                                    "Penulis: ${film![index].Penulis.toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  Text(
                                    "Tahun: ${film![index].TahunTerbit.toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PopupMenuButton<String>(
                              icon: const Icon(
                                Icons.more_vert,
                                color: Color.fromARGB(255, 0, 0, 0),
                                size: 30.0,
                              ),
                              itemBuilder: (BuildContext context) {
                                return listAct.map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                    onTap: () {
                                      if (choice == "Ubah") {
                                        setState(() {
                                          film_id = film![index].id;
                                        });
                                        titleInput.text = film![index].title;
                                        gambarInput.text =
                                            film![index].posterPath;
                                        Penerbit.text = film![index].Penerbit;
                                        Penulis.text = film![index].posterPath;
                                        TahunTerbit.text =
                                            film![index].TahunTerbit.toString();
                                        voteAverage.text =
                                            film![index].voteAverage.toString();
                                        modal.showFullModal(
                                            context, fromTambah(index));
                                      } else if (choice == "Hapus") {
                                        film!.removeWhere((item) =>
                                            item.id == film![index].id);
                                        getFilm();
                                      }
                                    },
                                  );
                                }).toList();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Text("Data Kosong"),
      bottomNavigationBar: BottomNav(2),
    );
  }

  Widget fromTambah(index) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text("Tambah Data"),
          TextFormField(
            controller: titleInput,
            decoration: InputDecoration(label: Text("Title")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: gambarInput,
            decoration: InputDecoration(label: Text("Gambar")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: Penerbit,
            decoration: InputDecoration(label: Text("Penerbit")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: voteAverage,
            decoration: InputDecoration(label: Text("Stok")),
            validator: (value) {
              if (value!.isEmpty) {
                return 'harus diisi';
              } else {
                return null;
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (index != null) {
                  film![index].id = film_id!;
                  film![index].title = titleInput.text;
                  film![index].Penerbit = Penerbit.text; // tam
                  film![index].Penulis = Penulis.text; //
                  film![index].posterPath = gambarInput.text;
                  film![index].TahunTerbit = double.parse(TahunTerbit.text);
                  film![index].voteAverage = double.parse(voteAverage.text);
                  getFilm();
                } else {
                  film_id = film!.length + 1;
                  Perpus data = Perpus(
                    id: film_id!,
                    title: titleInput.text,
                    posterPath: gambarInput.text,
                    Penerbit: Penerbit.text,
                    Penulis: Penulis.text,
                    TahunTerbit: double.parse(TahunTerbit.text),
                    voteAverage: double.parse(voteAverage.text),
                    imageWidth: 10000,
                    imageHeight: 200000,
                  );
                  addFilm(data);
                }
                Navigator.pop(context);
              }
            },
            child: Text("Simpan"),
          ),
        ],
      ),
    );
  }
}
