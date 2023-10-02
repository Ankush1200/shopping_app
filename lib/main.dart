import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeNotifier(),
      child: MaterialApp(
        theme:ThemeData(
          fontFamily: 'lato',
          colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromRGBO(254, 206, 1, 1),
          primary:const Color.fromARGB(255, 172, 158, 5) ,
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:15,
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:16,
            ),
            bodySmall:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:15,
            ) 
          ), 
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(),
      ),
    );
  }
}
