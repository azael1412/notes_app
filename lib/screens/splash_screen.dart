import 'package:flutter/material.dart';
import 'package:notes_app/notes/blocs/slideshow_bloc.dart';

import 'package:notes_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initShared();
  }

  void initShared() {
    final value = Provider.of<SlideshowBloc>(context, listen: false);
    // print("value slide scren ${value.show}");

    if (value.show == false) {
      Future.delayed(
        Duration(milliseconds: 3000),
        () => Navigator.of(context).pushReplacementNamed(AppRoutes.slideShow),
      );
    } else {
      Future.delayed(
        Duration(milliseconds: 3000),
        () => Navigator.of(context).pushReplacementNamed(AppRoutes.notes),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/img/no_data.png')),
    );
  }
}
