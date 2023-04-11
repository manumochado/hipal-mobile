import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DesignTextProperty extends StatefulWidget {
  String title;
  String value;
  bool flagBtn;
  bool enableText;
  DesignTextProperty(this.title, this.value, this.flagBtn, this.enableText,
      {Key? key})
      : super(key: key);

  @override
  State<DesignTextProperty> createState() =>
      // ignore: no_logic_in_create_state
      _DesignTextPropertyState();
}

class _DesignTextPropertyState extends State<DesignTextProperty> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  void initState() {
    _textController.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Color(0xff9FA7B8),
          fontSize: 12,
        ),
      ),
      subtitle: TextField(
        enabled: widget.enableText,
        controller: _textController,
        style: const TextStyle(
          color: Color(0xff343887),
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
      trailing: Visibility(
        visible: widget.flagBtn,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.center,
              end: Alignment(0, 1.0),
              colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
            ),
          ),
          child: IconButton(
              icon: Image.asset('assets/icons/iconEdit.png'),
              onPressed: () {
                setState(() {});
                widget.enableText = !widget.enableText;
              }),
        ),
      ),
    );
  }
}
