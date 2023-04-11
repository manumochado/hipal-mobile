import 'package:flutter/material.dart';

class AppBarBackWidget extends StatefulWidget with PreferredSizeWidget{

  int color_buttons;
  int color_title;
  int color_background;
  String name_title;
  bool with_search = false;

  AppBarBackWidget({
    required this.color_buttons,
    required this.color_title,
    required this.color_background,
    required this.name_title,
    required this.with_search
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppBarBackWidget();
  }

}

class _AppBarBackWidget extends State<AppBarBackWidget>{

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Color(widget.color_background),
      leading: BackButton(
        color: Color(widget.color_buttons),
        onPressed: (){
          Navigator.of(context, rootNavigator: true).pop();
        },
      ),
      elevation: 0,
      title: !isSearching
          ? Text(
        widget.name_title,
        style: TextStyle(
            color: Color(widget.color_title),
            fontSize: 16.0,
            fontWeight: FontWeight.w600
        ),
      )
          : TextField(
        onChanged:(value){
        },
        style: TextStyle(color: Color(widget.color_buttons)),
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Color(widget.color_buttons),
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        widget.with_search ?
        isSearching ?
        IconButton(
          icon: Icon(Icons.cancel),
          color: Color(widget.color_buttons),
          onPressed: () {
            setState(() {
              this.isSearching = false;
            });
          },
        )
            : IconButton(
          icon: Icon(Icons.search),
          color: Color(widget.color_buttons),
          onPressed: () {
            setState(() {
              this.isSearching = true;
            });
          },
        ) : Container()
      ],
    );
  }

}