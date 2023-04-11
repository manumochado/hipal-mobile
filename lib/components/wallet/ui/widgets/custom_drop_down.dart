import 'package:flutter/material.dart';
import 'package:hipal/utils/extension_color.dart';

class CustomSelectField extends StatelessWidget {

  final String label;
  final List<String> ops;
  final refState;
  final Function(String val) onChange;
  

  const CustomSelectField({
    Key? key,
    required this.label,
    required this.ops,
    required this.refState, 
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    String localState = refState.toString();

    return Container(
      
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 32),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(
              fontFamily: 'Basic Commercial SR Pro',
              fontSize: 12 ,
              fontWeight: FontWeight.w400, 
              color: '#343887'.toColor()
          )),

          Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 5),
            height: 40,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: '#E5E5E5'.toColor(),
              width: 2,
            ),
        
            ),

            child: DropdownButton(
              items: ops.map((String value) {
                
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, textAlign: TextAlign.start,),
                );
              }).toList(),

              isExpanded: true,
              underline: const SizedBox(),
              onChanged: (newValue) {        
                onChange(newValue.toString());
              },

              hint: Text(
                '$refState',
                style: TextStyle(
                fontFamily: 'Basic Commercial SR Pro',
                fontSize: 12 ,
                fontWeight: FontWeight.w400, 
                color: '#8D8D8D'.toColor(),
              )
              ),
            ),

          )                        
        ]
      ),
    );
  }
}
