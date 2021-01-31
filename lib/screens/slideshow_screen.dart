import 'package:flutter/material.dart';
import 'package:notes_app/notes/blocs/theme_bloc.dart';
// import 'package:notes_app/notes/screens/notes_screen.dart';
import 'package:notes_app/routes/app_routes.dart';
// import 'package:notes_app/routes/app_routes.dart';
// import 'package:headers_app/src/theme/theme.dart';
import 'package:notes_app/widgets/slideshow.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowScreen extends StatelessWidget {
  const SlideshowScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _MySlideshow()),
          ],
        ),
      ),
    );
  }
}

class _MySlideshow extends StatelessWidget {
  const _MySlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body(context: context);
  }

  Widget _body({BuildContext context}) {
    final appTheme = Provider.of<ThemeBloc>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    final separatorWidget = SizedBox(
      height: 20.0,
    );
    final skipButton = RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      color: Colors.blue,
      onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.notes),
      child: Text(
        "Omitir",
        style: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
    );
    return Slideshow(
      dotsTop: true,
      primaryColor: (appTheme.isDarkMode)
          ? accentColor
          : Color(0xffff5a7e), //Colors.indigo[800],
      secundaryColor: Colors.blue,
      primaryBullet: 18.0,
      secundaryBullet: 12.0,
      slides: [
        Column(
          children: [
            _imgSvg(name: 'assets/img/slide-1.svg'),
            // Expanded(child: SvgPicture.asset('assets/img/slide-1.svg')),
            Text(
              "Lorem Ipsum is simply dummy text.",
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
            separatorWidget,
            skipButton
          ],
        ),
        Column(
          children: [
            _imgSvg(name: 'assets/img/slide-2.svg'),
            Text(
              "Lorem Ipsum is simply dummy text.",
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
            separatorWidget,
            skipButton
          ],
        ),
        Column(
          children: [
            _imgSvg(name: 'assets/img/slide-3.svg'),
            Text(
              "Lorem Ipsum is simply dummy text.",
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
            separatorWidget,
            skipButton
          ],
        ),
        Column(
          children: [
            _imgSvg(name: 'assets/img/slide-4.svg'),
            Text(
              "Lorem Ipsum is simply dummy text.",
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
            separatorWidget,
            skipButton
          ],
        ),
        Column(
          children: [
            _imgSvg(name: 'assets/img/slide-5.svg'),
            Text(
              "Lorem Ipsum is simply dummy text.",
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
            separatorWidget,
            skipButton
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _imgSvg(name: 'assets/img/slide-1.svg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text("SignUp",
                      style: TextStyle(fontSize: 18.0, color: Colors.white)),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text("SignIn",
                      style: TextStyle(fontSize: 18.0, color: Colors.white)),
                )
              ],
            )
          ],
        )
        /*SvgPicture.asset('assets/img/slide-1.svg'),
        SvgPicture.asset('assets/img/slide-2.svg'),
        SvgPicture.asset('assets/img/slide-3.svg'),
        SvgPicture.asset('assets/img/slide-4.svg'),
        SvgPicture.asset('assets/img/slide-5.svg')*/
      ],
    );
  }

  Widget _imgSvg({String name}) {
    return Expanded(
      child: AnimatedCrossFade(
          duration: const Duration(seconds: 3),
          firstChild: Image.asset('assets/img/no-image.jpg'),
          secondChild: SvgPicture.asset(name),
          crossFadeState:
              CrossFadeState.showSecond //: CrossFadeState.showSecond,
          ),
    );
  }
}
