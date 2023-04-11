import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PulsatingCircleIconButton extends StatefulWidget {
    const PulsatingCircleIconButton({
      Key? key,
      required this.onLongPress,
    }) : super(key: key);

    final GestureLongPressCallback onLongPress;

    @override
    _PulsatingCircleIconButtonState createState() => _PulsatingCircleIconButtonState();
}

class _PulsatingCircleIconButtonState extends State<PulsatingCircleIconButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 12.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onLongPress: widget.onLongPress,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Ink(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                for (int i = 1; i <= 2; i++)
                  BoxShadow(
                    color: Colors.white.withOpacity(_animationController.value / 2),
                    spreadRadius: _animation.value * i,
                  )
              ],
            ),
            child: Text(
              "SOS",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFF343887)
              ),
            ),
          );
        },
      ),
    );
  }
}