import 'package:flutter/material.dart';

@immutable
class DemoAppIcon extends StatelessWidget {
  const DemoAppIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: FittedBox(
        child: SizedBox(
          width: 80.0,
          height: 80.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.blue],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                )),
            child: Center(
              child: Icon(
                Icons.ac_unit,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
