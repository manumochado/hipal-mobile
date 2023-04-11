import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/events/bloc/events_bloc.dart';
import 'package:hipal/components/events/model/events.dart';

class FavoriteIcon extends StatefulWidget {
  VoidCallback voidCallback;
  bool pressed;

  FavoriteIcon({required this.voidCallback, required this.pressed});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteIcon();
  }
}

class _FavoriteIcon extends State<FavoriteIcon> {

  void _onPressedFav() {
    setState(() {
      widget.pressed = !widget.pressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Events event;
    // TODO: implement build
    return BlocBuilder <EventsBloc,EventsState>(
        builder: (context,state){
          return FloatingActionButton(
            mini: true,
            backgroundColor: Colors.transparent,
            onPressed: widget.voidCallback,
            heroTag: null,
            elevation: 0,
            child: Icon(
              this.widget.pressed ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          );
        });

  }
}