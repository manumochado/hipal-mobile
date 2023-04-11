import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselOnlyImages extends StatelessWidget {
  final List<Image>? items;
  final List<File>? itemsFiles;
  final bool localImage;

  CarouselOnlyImages(
      {this.items = const [],
      this.itemsFiles = const [],
      this.localImage = false});

  @override
  Widget build(BuildContext context) {
    return items!.length > 1 ||
            itemsFiles!.length > 1 ||
            (items!.length + itemsFiles!.length) > 1
        ? CarouselSlider(options: CarouselOptions(height: 250.0), items: items)
        : Container(
            margin: EdgeInsets.only(
                left: 15.0, right: 15.0, top: 13.0, bottom: 23.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
            child: SizedBox(
              child: ClipRRect(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                decoration: BoxDecoration(
                  color: const Color(0xff6456EB),
                  borderRadius: BorderRadius.all(Radius.circular(19.0)),
                ),
                child: items!.length > 0
                    ? items![0]
                    : Image.file(
                        itemsFiles![0],
                        fit: BoxFit.cover,
                      ),
              )),
            ),
          );
  }
}
