import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsTop;
  final Color primaryColor;
  final Color secundaryColor;
  final double primaryBullet;
  final double secundaryBullet;
  const Slideshow(
      {Key key,
      @required this.slides,
      this.dotsTop = true,
      this.primaryColor = Colors.blue,
      this.secundaryColor = Colors.grey,
      this.primaryBullet = 12.0,
      this.secundaryBullet = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => _SlideshowModel(),
        child: Center(child: Builder(builder: (BuildContext context) {
          Provider.of<_SlideshowModel>(context).primaryColor =
              this.primaryColor;
          Provider.of<_SlideshowModel>(context).secundaryColor =
              this.secundaryColor;

          Provider.of<_SlideshowModel>(context).primaryBullet =
              this.primaryBullet;
          Provider.of<_SlideshowModel>(context).secundaryBullet =
              this.secundaryBullet;
          return _BodySlideShow(dotsTop: dotsTop, slides: slides);
        })),
      ),
    );
  }
}

class _BodySlideShow extends StatelessWidget {
  const _BodySlideShow({
    Key key,
    @required this.dotsTop,
    @required this.slides,
  }) : super(key: key);

  final bool dotsTop;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.dotsTop)
          _Dots(
            totalSlides: this.slides.length,
          ),
        Expanded(child: _Slides(slides: this.slides)),
        if (!this.dotsTop) _Dots(totalSlides: this.slides.length)
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides({Key key, this.slides}) : super(key: key);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController.addListener(() {
      // print("pagina actual ${pageViewController.page}");
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        physics: BouncingScrollPhysics(),
        // children: [
        //   _Slide(svg: 'assets/img/svg/slide-5.svg'),
        //   _Slide(svg: 'assets/img/svg/slide-2.svg'),
        //   _Slide(svg: 'assets/img/svg/slide-5.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  // final String svg;

  const _Slide({Key key, this.slide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  const _Dots({Key key, this.totalSlides}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      // color: Colors.red,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              List.generate(this.totalSlides, (index) => _Dot(index: index))
          /*children: [
          _Dot(index: 0),
          _Dot(
            index: 1,
          ),
          _Dot(index: 2)
        ],*/
          ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double size;
    Color color;
    if (slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5) {
      size = slideshowModel.primaryBullet;
      color = slideshowModel.primaryColor;
    } else {
      size = slideshowModel.secundaryBullet;
      color = slideshowModel.secundaryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOutQuad,
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0.0;
  Color _primaryColor = Colors.blue;
  Color _secundaryColor = Colors.grey;
  double _primaryBullet = 12.0;
  double _secundaryBullet = 12.0;

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color color) {
    this._primaryColor = color;
    // notifyListeners();
  }

  Color get secundaryColor => this._secundaryColor;

  set secundaryColor(Color color) {
    this._secundaryColor = color;
    // notifyListeners();
  }

  double get currentPage => this._currentPage;

  set currentPage(double currentP) {
    this._currentPage = currentP;
    notifyListeners();
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double bullet) {
    this._primaryBullet = bullet;
    // notifyListeners();
  }

  double get secundaryBullet => this._secundaryBullet;

  set secundaryBullet(double bullet) {
    this._secundaryBullet = bullet;
    // notifyListeners();
  }
}
