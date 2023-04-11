import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hipal/serializers/image.dart' as ImageSerializer;
class CarouselImages extends StatelessWidget{

  final List<ImageSerializer.Image>? items;
  final List<File>? itemsFiles;
  final bool localImage;

  CarouselImages({this.items = const [], this.itemsFiles = const [], this.localImage = false});

  @override
  Widget build(BuildContext context) {
    return items!.length  > 1 || itemsFiles!.length > 1 || (items!.length + itemsFiles!.length) > 1 ?
    CarouselSlider(
      options: CarouselOptions(height: 250.0),
      items: _buildImageList(items, itemsFiles)
    )
        :
    Container(
      margin: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 13.0,
          bottom: 23.0
      ),
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
              borderRadius: BorderRadius.all( Radius.circular(19.0)),
            ),
            child: items!.length >0 ? Image.network(items![0].url.toString(), fit: BoxFit.cover) : Image.file(
              itemsFiles![0],
              fit: BoxFit.cover,
            ),
          )
        ),
      ),
    );
  }

  _buildImageList(List<ImageSerializer.Image>? itemsNetwork, List<File>? itemsFiles){
    print("++++++++++++++++++++++++++++++++++++++++++++++++ creando la lista ${itemsNetwork?.length} ${itemsFiles?.length}");
    List<Builder> listImages;

    List<Builder> list1 = itemsNetwork!.map((imgLostObject) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: const Color(0xff6456EB),
              image: DecorationImage(
                image:NetworkImage(imgLostObject.url != null
                    ? imgLostObject.url.toString()
                    : ''),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      );
    }).toList();

    List<Builder> list2 = itemsFiles != null ? itemsFiles.map((imgFile) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: const Color(0xff6456EB),
              image: DecorationImage(
                image: AssetImage(imgFile.path),
                fit: BoxFit.cover,
              ),
            ),
            child:  Image.file(
              imgFile,
              fit: BoxFit.cover,
            ),
          );
        },
      );
    }).toList() : [];

    listImages = [...list1,...list2];
    return listImages;


  }

}