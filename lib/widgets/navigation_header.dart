import 'package:flutter/material.dart';

class NavigationHeader extends StatefulWidget {
  final String title;
  final Function actionLeft;
  final IconData iconLeft;
  final Function actionRight;
  final IconData iconRight;
  NavigationHeader(
      {Key key,
      @required this.actionLeft,
      this.iconLeft = Icons.arrow_back_ios,
      this.actionRight,
      this.iconRight = Icons.save_outlined,
      this.title = ""})
      : super(key: key);

  @override
  _NavigationHeaderState createState() => _NavigationHeaderState();
}

class _NavigationHeaderState extends State<NavigationHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        padding: EdgeInsets.only(left: 8.0),
        icon: Icon(widget.iconLeft),
        //const Icon(Icons.arrow_back_ios),
        onPressed: () => widget.actionLeft(),
        iconSize: 32.0,
        // color: Colors.white,
      ),
      if (widget.title != "") ...[
        Expanded(child: Container()),
        Text(
          "Mis Notas",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
        ),
        Expanded(child: Container()),
      ] else
        Expanded(child: Container()),
      (widget.actionRight != null && widget.iconRight != null)
          ? IconButton(
              icon: Icon(widget.iconRight),
              onPressed: () => widget.actionRight(),
              iconSize: 32.0,
              // color: Colors.white,
            )
          : Container()
    ]);
  }
}
