import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DownloadButton(),
    debugShowCheckedModeBanner: false,
  ));
}

@immutable
class DownloadButton extends StatefulWidget {
  const DownloadButton({
    Key? key,
  }) : super(key: key);

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  @override
  Widget build(BuildContext context) {
    // TODO:
    return SizedBox();
  }
}
