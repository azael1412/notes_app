import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:notes_app/notes/blocs/theme_bloc.dart';

import 'package:notes_app/notes/screens/notes_screen.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//agregar animaciones basicas
//implementar hive
//implementar shared_preferences//ya
// nota el color de texto de las notas debe ser blancos
//checar sobre actualizaciones de app
//checar efecto material para los listile
//agregar para que no cambie de posicion de pantalla
//agregar sombras al show

//https://stackoverflow.com/questions/50619848/how-to-change-text-color-of-appbar-icon-color-of-fab-universally-using-theme
//checar sobre temas ligth y dark
//manejador de tema con provider
//guardar el estado del tema en shared preferences
//quitar sombras cuando se ponga en modo oscuro->importante
//implemenar que no se cambie de pantalla//ya
//ocupar toda la pantalla onfiguracion//ya
//implementar boton de cambio de tema//ya
//implmentar hive
//implementar scroll infinito y search delegate,
//checar notificaciones locales y con firebase
//agregar imagen de entrada con pageview y splashscreen
//login
//agregar animaciones en todo lo que se pueda checar animaciones
//checa rx_dart y stream an future
//agregar politicas de privacidad si se agrega el login
//wb_sunny icons ligth mode an dark mode brightness_2
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (value) => runApp(ChangeNotifierProvider<ThemeBloc>(
          create: (context) => ThemeBloc(sharedPreferences: sharedPreferences),
          child: MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final SharedPreferences sharedPreferences;
  const MyApp({Key key, this.sharedPreferences}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeBloc>(context).currentTheme;
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      /*theme: ThemeData(
        fontFamily: "Roboto",
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),*/
      home: NotesScreen(), //ShowNoteScreen(),
    );
  }
}
