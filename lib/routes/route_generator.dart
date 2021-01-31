import 'package:flutter/material.dart';

import 'package:notes_app/routes/app_routes.dart';

import 'package:notes_app/notes/screens/notes_screen.dart';
import 'package:notes_app/notes/screens/create_update_note_screen.dart';
import 'package:notes_app/notes/screens/show_note_screen.dart';

import 'package:notes_app/notes/blocs/button_bloc.dart';
import 'package:notes_app/screens/slideshow_screen.dart';
import 'package:notes_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute({RouteSettings settings}) {
    switch (settings.name) {
      case (AppRoutes.splash):
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case (AppRoutes.slideShow):
        return MaterialPageRoute(builder: (_) => SlideshowScreen());

      case (AppRoutes.notes):
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider(
                create: (_) => ButtonBloc(), child: NotesScreen()));
      case (AppRoutes.createOrUpdateNote):
        final args = settings.arguments;
        if (args is CreateOrUpdateNoteArguments) {
          return MaterialPageRoute(
              builder: (_) => CreateOrUpdateNoteScreen(
                  note: args.note,
                  updateNoteList: args.updateList,
                  scaffoldKey: args.scaffoldKey));
        }
        break;
      case (AppRoutes.showNote):
        final args = settings.arguments;
        if (args is ShowNoteArguments) {
          return MaterialPageRoute(
              builder: (_) => ShowNoteScreen(note: args.note));
        }
        break;
    }
    // return null;
  }

  static Route<dynamic> onUnknownRoute({RouteSettings settings}) {
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("Pantalla No Encontrada"),
        ),
      );
    });
  }
}
