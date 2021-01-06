import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  final bool isExtended;
  final Function function;

  FloatButton(this.isExtended, this.function);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        child: RawMaterialButton(
            elevation: 5.0,
            shape: isExtended
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))
                : CircleBorder(),
            onPressed: () => function(),
            fillColor:
                Theme.of(context).floatingActionButtonTheme.backgroundColor,
            // fillColor: Colors.blue[600],
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: isExtended
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.note_add_outlined,
                          color: Theme.of(context)
                              .floatingActionButtonTheme
                              .foregroundColor,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Add Note",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .floatingActionButtonTheme
                                  .foregroundColor),
                        )
                      ],
                    )
                  : Icon(
                      Icons.note_add_outlined,
                      color: Theme.of(context)
                          .floatingActionButtonTheme
                          .foregroundColor,
                    ),
            )));
  }
}
