import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/perpus_view.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       initialRoute: '/',
      routes: {
      //   '/login': (context) => LoginView(),
      //   '/': (context) => HomeView(),
      // '/transaksi': (context) => TransaksiView(),
       '/': (context) =>PerpusView (),
      
      // '/profile': (context) => ProfileView(), 
       },
      
   
    
    );
  }
}
