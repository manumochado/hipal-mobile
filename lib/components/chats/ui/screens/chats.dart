import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/chats/bloc/profiles_bloc.dart';
import 'package:hipal/components/chats/model/chat.dart';
import 'package:hipal/components/chats/ui/widgets/list.dart';
import 'package:hipal/components/chats/ui/widgets/list_profiles.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/menu/ui/widgets/main_menu.dart';
import 'package:hipal/constants.dart';
import 'package:hipal/widgets/leading.dart';

import '../../../user/bloc/user_bloc.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreen createState() => _ChatsScreen();
}

class _ChatsScreen extends State<ChatsScreen> {
  List<Chat> items = [];
  late FocusNode _focus = FocusNode();
  late TextEditingController _controller = TextEditingController(text: "");
  late ProfilesBloc profileBloc;
  late ChatsBloc chatBloc;
  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () {
      profileBloc = BlocProvider.of<ProfilesBloc>(context);
      chatBloc = BlocProvider.of<ChatsBloc>(context);
    });
  }

  @override
  void dispose() {
    profileBloc.add(ResetProfilesSearch());
    chatBloc.add(ChangeSearchValue(''));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child: BlocBuilder<ChatsBloc, ChatsState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
        resizeToAvoidBottomInset: false, //Columns keyboard not resize
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: Text('Chat',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xff343887),
              )),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          // backgroundColor: Colors.blueAccent,
          leading: LeadingHipal(color: Color(0xff8075FB)),
          toolbarHeight: 60,
          //bottom: ,
        ),
        backgroundColor: Colors.white,
        drawer: DrawerMainMenu(),
        body: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Habilitar chat',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff343887),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    !state.loadingToogle
                        ? FlutterSwitch(
                            showOnOff: true,
                            width: 120.0,
                            height: 40.0,
                            toggleSize: 38.0,
                            value: state.toogle,
                            borderRadius: 30.0,
                            padding: 2.0,
                            toggleColor: Colors.white,
                            //switchBorder: Border.all(
                            //  color: Color(0xff6456EB),
                            //  width: 2.0,
                            // ),
                            activeColor: Color(0xff6456EB),
                            inactiveColor: Color(0xff8075FB),
                            onToggle: (val) {
                              setState(() {
                                BlocProvider.of<ChatsBloc>(context)
                                    .chatsRepo
                                    .toogleUsersChat(context,
                                        {'is_enabled_chats': val.toString()});
                                BlocProvider.of<ChatsBloc>(context)
                                    .add(ChangeToggle(val));
                              });
                            },
                          )
                        : CircularProgressIndicator(
                            color: Color(0xff6456EB), strokeWidth: 3.0),
                  ],
                )),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Text(
                    'Al deshabilitar el chat dejas de ser visible para las otras personas y',
                    style: TextStyle(color: Color(0xff6456EB), fontSize: 10.0),
                  ),
                  Text('solo podras chatear con el administrador.',
                      style:
                          TextStyle(color: Color(0xff6456EB), fontSize: 10.0)),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: bottomChat(),
            ),
            Expanded(
                flex: 75,
                child:
                    (state.s.toString() != "") ? ProfilesList() : ChatsList())
          ],
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: (MediaQuery.of(context).viewInsets.bottom > 0)
            ? Text("")
            : FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      ));
    }));
  }

  Container bottomChat() {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(width: 1.0, color: Color(0xFFF3F3FE)))),
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding, right: kDefaultPadding, top: 10.0),
        child: Container(
          height: 40,
          padding: EdgeInsets.only(
            left: kDefaultPadding * 0.75,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFE),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.42,
                child: TextFormField(
                  // key: UniqueKey(),
                  controller: _controller,
                  focusNode: _focus,
                  maxLines: 1,
                  textInputAction: TextInputAction.search,
                  // initialValue: state.messageInput,
                  decoration: InputDecoration(
                    hintText: "Buscar contactos...",
                    hintStyle:
                        TextStyle(color: Color(0xFFB1B4C7), fontSize: 12.0),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 12.0, height: 1.2),
                  scrollPadding: EdgeInsets.all(0),
                  validator: (value) =>
                      (value == null || value == '') ? '' : null,
                  onChanged: (value) async {},
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              SizedBox(
                width: 48.0,
                height: 75.0,
                child: FloatingActionButton(
                    backgroundColor: Color(0xFFF9FAFE),
                    child: Icon(
                      const IconData(0xe904, fontFamily: 'icomoon'),
                      color: kColorIcon,
                      size: 35.0,
                    ),
                    onPressed: () async {
                      final _userBloc = BlocProvider.of<UserBloc>(context);
                      String? idTower =
                          _userBloc.state.userInfo?.apartment?.tower?.id ?? '';
                      BlocProvider.of<ChatsBloc>(context).add(ChangeSearch(
                          _controller.text,
                          _controller.selection.base.offset,
                          ''));
                      BlocProvider.of<ProfilesBloc>(context)
                          .add(ChangeSearchProfile(_controller.text, idTower));
                      BlocProvider.of<ProfilesBloc>(context)
                          .add(LoadRefreshProfiles(context));
                      FocusScope.of(context).unfocus();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
