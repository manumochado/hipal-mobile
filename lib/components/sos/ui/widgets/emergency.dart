

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/messages/ui/widgets/body.dart';
import 'package:hipal/components/messages/ui/widgets/chat_input_field.dart';
import 'package:hipal/components/sos/bloc/sos_bloc.dart';
import 'package:hipal/components/sos/ui/widgets/header.dart';
import 'package:hipal/constants.dart';

class ContactEmergency extends StatefulWidget {
  const ContactEmergency({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactEmergency> createState() => _ContactEmergencyState();
}

class _ContactEmergencyState extends State<ContactEmergency> {
  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<SosBloc, SosState>(builder: (context, state) {
      return Scaffold(
        // appBar: const HeaderEmergency(),
        backgroundColor: Color(0xFFF9FAFE),

        // body: Padding(
        //   padding: EdgeInsets.only(
        //     bottom: MediaQuery.of(context).viewInsets.bottom!=0 ? 70 : 5
        //   ),
        //   child: ContainerChat()
        // ),
        
        body: Stack(
          // width: MediaQuery.of(context).size.width,
          children: [
            if(MediaQuery.of(context).viewInsets.bottom==0)
              const HeaderEmergency(),

            ContainerChat(viewBottom: MediaQuery.of(context).viewInsets.bottom),

            // ButtonChat()
          ],
        ),

        bottomNavigationBar: StickyBottomMessage(child: ChatInputField()),
      );
    // });
  }
}

class ContainerChat extends StatefulWidget {
  const ContainerChat({
    Key? key,
    this.viewBottom = 0.0,
  }) : super(key: key);

  final double viewBottom;

  @override
  State<ContainerChat> createState() => _ContainerChatState();
}

class _ContainerChatState extends State<ContainerChat> {
  @override
  Widget build(BuildContext context) {
    print("viewInsets.bottom" + widget.viewBottom.toString() );

    return BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(
          top: 10,
          bottom: widget.viewBottom!=0 ? 70.0 : 5.0,
          left: 0,
          right: 0
        ),
        child: Container(
          // height: widget.viewBottom>0 ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height/2,
          margin: EdgeInsets.only(top: ((widget.viewBottom>0) ? 30.0 : 178.0), left: 5, right: 5),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 10,),

                  // if(state.chat?.user!.photo == null || state.chat?.user!.photo == '') ...[
                  if(true) ...[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff6456EB),
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    )
                  ] else ... [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color(0xff6456EB),
                        // image: DecorationImage(
                        //   image: NetworkImage(state.chat!.user!.photo!.url != null
                        //       ? state.chat!.user!.photo!.url.toString()
                        //       : ''),
                        //   fit: BoxFit.cover,
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(19.0)),
                      ),
                    ),
                  ],

                  SizedBox(width: 10,),

                  SizedBox(
                    width: 190,
                    child: 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Text(
                            // state.chat!.fullname != null ? state.chat!.fullname.toString() : '',
                            'asd',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0, color: kTextColor ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Torre 4, apartament 401' != null ? ''.toString() : '',
                            style: TextStyle(fontSize: 12.0, color: kTextColorSecond),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ]
                      )
                  )
                ],
              ),


              Expanded(
                child: BodyMessages()
              ),
              
            ]
          ),
          decoration:  BoxDecoration(
            border: Border.all(color: Colors.transparent),
            color: Color(0xFFF9FAFE),
            borderRadius: BorderRadius.circular(30.0),
            // boxShadow: [
            //   BoxShadow(
            //     color: Color(0xff77739e).withOpacity(.16),
            //     blurRadius: 15,
            //     offset: Offset(0, 5),
            //   )
            // ]
          ),
        ),
      );
    });
  }
}


class ButtonChat extends StatelessWidget {
  const ButtonChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height/2+200), left: 20, right: 20),
      child: MaterialButton(
        color: Color(0xFFF1464F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: Color(0xffF1464F),
          ),
        ),
        elevation: 0,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // if (state.isLoading)
              //   Container(
              //     width: 24,
              //     height: 24,
              //     padding: const EdgeInsets.all(2.0),
              //     child: const CircularProgressIndicator(
              //       color: Colors.white,
              //       strokeWidth: 3,
              //     ),
              //   ),
              SizedBox(width: 5.0),
              Text(
                'Finalizar alerta',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ]),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffF1464F).withOpacity(0.34),
                  spreadRadius: 0,
                  blurRadius: 9,
                  offset: const Offset(0, 5), // changes position of shadow
                ),
              ],
            )),
        onPressed: () async {
        }
      ),
    );
  }
}

class StickyBottomMessage extends StatelessWidget {
  final child;
  StickyBottomMessage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -1*MediaQuery.of(context).viewInsets.bottom),
      child: child,
    );
  }
}