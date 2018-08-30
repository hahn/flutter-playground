import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCircleAvatar extends StatefulWidget {

  NetworkImage image;
  String initials;


  CustomCircleAvatar({this.image, this.initials});

  @override
  State createState() {
    return _CustomCircleAvatar();
  }
}

class _CustomCircleAvatar extends State<CustomCircleAvatar> {

  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    widget.image.resolve(ImageConfiguration()).addListener((_,__){
      if(mounted){
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircleAvatar(backgroundImage: AssetImage(widget.initials))
        : CircleAvatar(backgroundImage: widget.image);
  }
}