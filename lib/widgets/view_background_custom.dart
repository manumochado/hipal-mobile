import 'package:flutter/material.dart';

// ignore_for_file: unused_local_variable
class ViewBackgroundCustom extends StatelessWidget {
  final Widget bodyChild;
  final Widget HeaderAreaChild;
  final String backgroundImgHeader;

  const ViewBackgroundCustom(
      {Key? key,
      required this.bodyChild,
      required this.backgroundImgHeader,
      required this.HeaderAreaChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Center(
            child: _HeaderArea(
                backgroundImgHeader: backgroundImgHeader,
                HeaderAreaChild: HeaderAreaChild),
          ),
          this.bodyChild,
        ],
      ),
    );
  }
}

class _HeaderArea extends StatelessWidget {
  final String backgroundImgHeader;
  final Widget HeaderAreaChild;

  const _HeaderArea(
      {Key? key,
      required this.backgroundImgHeader,
      required this.HeaderAreaChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Image(image: AssetImage(backgroundImgHeader)),
          SafeArea(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                child: HeaderAreaChild),
          )
        ],
      ),
    );
  }
}
