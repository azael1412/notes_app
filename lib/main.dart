// import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/notes/blocs/slideshow_bloc.dart';
// import 'package:notes_app/notes/blocs/button_bloc.dart';

import 'package:notes_app/notes/blocs/theme_bloc.dart';
import 'package:notes_app/routes/app_routes.dart';
import 'package:notes_app/routes/route_generator.dart';

// import 'package:notes_app/notes/screens/notes_screen.dart';

import 'package:notes_app/notes/models/note_model_hive.dart';
// import 'package:notes_app/notes/resources/notes_provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:flutter_animated_theme/animated_theme_app.dart';
import 'package:flutter_animated_theme/animation_type.dart';
import 'package:provider/provider.dart';

//checar con multiprovider
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(NoteAdapter());
  final sharedPreferences = await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp(sharedPreferences: sharedPreferences)));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({Key key, this.sharedPreferences}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeBloc>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeBloc>(
          create: (_) => ThemeBloc(sharedPreferences: sharedPreferences),
        ),
        ChangeNotifierProvider<SlideshowBloc>(
          create: (BuildContext context) =>
              SlideshowBloc(sharedPreferences: sharedPreferences),
        ),
      ],
      child: Consumer<ThemeBloc>(builder: (context, theme, child) {
        return AnimatedThemeApp(
          title: 'Notes App',
          debugShowCheckedModeBanner: false,
          themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          animationDuration: Duration(milliseconds: 2000),
          animationType: AnimationType.CIRCULAR_ANIMATED_THEME,
          darkTheme: theme.getThemeDark,
          theme: theme.currentTheme,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: (settings) =>
              RouteGenerator.onGenerateRoute(settings: settings),
          onUnknownRoute: (settings) =>
              RouteGenerator.onUnknownRoute(settings: settings),
        );
      }),
    );
  }
}
