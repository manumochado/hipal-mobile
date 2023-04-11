import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';

class ClassifiedsCarousel extends StatelessWidget {
  final List<ClassifiedImage> images;
  final List<String> base64images;
  final Function(String)? onDeleteBase64Image;
  final Function(ClassifiedImage)? onDeleteExistingImage;

  ClassifiedsCarousel({
    this.images: const [],
    this.base64images = const [],
    this.onDeleteBase64Image,
    this.onDeleteExistingImage,
  });

  @override
  Widget build(BuildContext context) {
    return images.length > 1 ||
            base64images.length > 1 ||
            (images.length + base64images.length) > 1
        ? CarouselSlider(
            options: CarouselOptions(height: 325.0),
            items: _buildImageList(images, base64images))
        : images.length > 0 || base64images.length > 0
            ? Container(
                margin: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 13.0, bottom: 23.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: ClipRRect(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff6456EB),
                          borderRadius: BorderRadius.all(Radius.circular(19.0)),
                        ),
                        child: images.length > 0
                            ? Image.network(images[0].url.toString(),
                                fit: BoxFit.cover)
                            : Image.memory(base64Decode(base64images[0]),
                                fit: BoxFit.cover),
                      ),
                      TextButton(
                          child: Text("Eliminar"),
                          onPressed: () {
                            images.length > 0
                                ? onDeleteExistingImage == null
                                    ? () {}
                                    : onDeleteExistingImage!.call(images[0])
                                : onDeleteBase64Image == null
                                    ? () {}
                                    : onDeleteBase64Image!
                                        .call(base64images[0]);
                          })
                    ],
                  ),
                ),
              )
            : SizedBox.shrink();
  }

  _buildImageList(List<ClassifiedImage> images, List<String> base64images) {
    List<Builder> listImages;

    List<Builder> list1 = images.map((image) {
      return Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: const Color(0xff6456EB),
                  image: DecorationImage(
                    image: NetworkImage(image.url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              TextButton(
                  child: Text("Eliminar"),
                  onPressed: () {
                    onDeleteExistingImage == null
                        ? () {}
                        : onDeleteExistingImage!.call(image);
                  })
            ],
          );
        },
      );
    }).toList();

    List<Builder> list2 = base64images.map((image) {
      return Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: const Color(0xff6456EB),
                ),
                child: Image.memory(base64Decode(image), fit: BoxFit.cover),
              ),
              TextButton(
                  child: Text("Eliminar"),
                  onPressed: () {
                    onDeleteBase64Image == null
                        ? () {}
                        : onDeleteBase64Image!.call(image);
                  })
            ],
          );
        },
      );
    }).toList();

    listImages = [...list1, ...list2];
    return listImages;
  }
}
