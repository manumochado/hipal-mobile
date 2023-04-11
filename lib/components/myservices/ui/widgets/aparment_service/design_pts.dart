import 'package:flutter/material.dart';

class DesignPts extends StatelessWidget {
  const DesignPts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 29),
      height: 56,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
        color: const Color(0xff8378FC),
        width: 1,
      ),
      ),
      child: Container(
      margin: const EdgeInsets.only(
          left: 21.0,
          top: 12.0,
          right: 21.0,
          bottom: 16.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Mis puntos",
            style: TextStyle(
                color: Color(0xFF9FA7B8),
                fontSize: 13.0,
                fontWeight:  FontWeight.w500
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 8.0,
                top: 2.0,
                right: 7.0,
                bottom: 2.0
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFDCFFED),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                const Image(
                  image: AssetImage(
                      'assets/images/iconGood.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 3.0
                  ),
                  child: const Text(
                    "100 Pts",
                    style: TextStyle(
                        color: Color(0xFF9FA7B8),
                        fontSize: 13.0,
                        fontWeight:  FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
}
