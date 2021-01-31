import 'package:flutter/material.dart';
import 'package:notes_app/utils/colorhex_to_colorint.dart';

class ColorSelection extends StatefulWidget {
  final Map<String, String> colors;
  final Function(String) onValueChanged;
  final String selected;
  final double top;
  final double right;
  ColorSelection(
      {Key key,
      @required this.colors,
      @required this.onValueChanged,
      this.top = 12.5,
      this.right = 12.5,
      @required this.selected})
      : super(key: key);

  @override
  _ColorSelectionState createState() => _ColorSelectionState();
}

class _ColorSelectionState extends State<ColorSelection> {
  String currentItem;
  String selectedAux;
  bool selectedColor;
  @override
  Widget build(BuildContext context) {
    selectedAux = widget.selected;
    selectedColor = false;
    var widgets = <Widget>[];
    widget.colors.forEach((name, color) {
      selectedColor = selectedAux == color;

      widgets.add(GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          // setState(() {
          currentItem = color;
          selectedColor = true;
          // });
          widget.onValueChanged(color);
        },
        child: CircularColor(
          color: color,
          selected: selectedColor,
          top: widget.top,
          right: widget.right,
        ),
      ));
    });
    selectedAux = null;

    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: widgets,
    );
  }
}

class CircularColor extends StatelessWidget {
  final String color;
  final bool selected;
  final double top;
  final double right;
  const CircularColor(
      {Key key,
      @required this.color,
      @required this.selected,
      this.top,
      this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("color $color");
    // print("selected $selected");
    // String auxColor = color.replaceAll('#', '0xff');
    // int hexColor = int.parse(auxColor);
    int auxColor = colorHexToColorInt(color);
    return Stack(
      children: [
        Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //       color: Colors.grey[100],
            //       blurRadius: 15.0,
            //       offset: Offset(0.0, 7.0))
            // ],
            shape: BoxShape.circle,
            color: Color(auxColor),
            // borderRadius: BorderRadius.circular(25.0),
            // border: Border.all(
            //   color: selected ? Color(hexColor) : Colors.black,
            //   width: selected ? 3.0 : 1.0,
            // ),
          ),
        ),
        if (selected)
          Positioned(
              top: top,
              right: right,
              child: Icon(Icons.check, size: 25, color: Colors.white))
      ],
    );
  }
}
