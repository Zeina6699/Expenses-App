import 'package:expansess_appp/Screens/expanses_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var myColorScheme=ColorScheme.fromSeed(seedColor: Colors.blue);
  var myDarkColorScheme=ColorScheme.fromSeed(seedColor: Colors.blue);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: myColorScheme,
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: myDarkColorScheme.onPrimaryContainer
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer
        ),
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:myColorScheme.onPrimaryContainer,
            foregroundColor: myColorScheme.primaryContainer
          )),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color:Theme.of(context).colorScheme.primary.withOpacity(0.5)
              ,fontSize: 17
            )
          ),
      ),



      darkTheme: ThemeData.dark().copyWith(
        colorScheme: myDarkColorScheme,
        appBarTheme:const AppBarTheme().copyWith(
          backgroundColor: myDarkColorScheme.primaryContainer
        ),
        cardTheme:const  CardTheme().copyWith(
          color: myDarkColorScheme.secondaryContainer,
          margin:const  EdgeInsets.symmetric(horizontal: 16,vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:myDarkColorScheme.primaryContainer
          )),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color:myDarkColorScheme.onSecondaryContainer,
              fontSize: 17
            )
          ),
      ),
      
home: const Expanses(),    );
  }
}
