import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/commonZones/bloc/common_zones_bloc.dart';
import 'package:hipal/components/friends/bloc/friends_bloc.dart';
import 'package:hipal/components/friends/model/friends.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:hipal/widgets/input_decorations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FriendScreen extends StatefulWidget {
  @override
  createState() => _FriendScreen();
}

class _FriendScreen extends State<FriendScreen> {
  List<Friends> items = [];
  final _controller = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  bool loadFinished = false;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _identityController = TextEditingController();

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _identityController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = "";
    final userID =
        BlocProvider.of<UserBloc>(context).state.userInfo?.user?.id ?? '';
    BlocProvider.of<FriendsBloc>(context)
        .add(LoadRefreshFriends(context, userID));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<FriendsBloc, FriendsState>(builder: (context, state) {
      items = (state.listFriends != null ? state.listFriends : [])!;
      return ElevatedButton(
        child: Icon(const IconData(0xe91f, fontFamily: 'icomoon'),
            size: 15, color: Color(0xFFF9FAFE)),
        onPressed: () {
          _onAlertWithCustomContentPressed(context);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 0),
          fixedSize: const Size(4, 4),
          shape: const CircleBorder(),
          primary: const Color(0xFF714CF6),
        ),
      );
    });
  }

  _onAlertWithCustomContentPressed(context) {
    Alert(
            context: context,
            content: SingleChildScrollView(
              child: contentPopup(context),
            ),
            style: AlertStyle(isButtonVisible: false, isCloseButton: false))
        .show();
  }

  Widget _search_field() {
    final userID =
        BlocProvider.of<UserBloc>(context).state.userInfo?.user?.id ?? '';
    return BlocBuilder<FriendsBloc, FriendsState>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(19, 119, 115, 158),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: TextField(
            controller: _controller,
            autocorrect: false,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.transparent)),
              suffixIcon: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: [Color(0xff8C81FE), Color(0xff776BF8)],
                    ),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.search,
                          size: 25, color: Color(0xffffffff)),
                      onPressed: () {
                        context.read<FriendsBloc>().add(
                            searchFriends(context, userID, _controller.text));
                      })),
            ),
          ),
        ),
      );
    });
  }

  contentPopup(context) {
    final userID =
        BlocProvider.of<UserBloc>(context).state.userInfo?.user?.id ?? '';
    return BlocBuilder<FriendsBloc, FriendsState>(builder: (context, state) {
      return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.height - 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _search_field(),
              _add_friend(),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 13.0, bottom: 23.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: items.length == 0
                        ? Container(
                            margin: EdgeInsets.only(top: 50),
                            alignment: Alignment.center,
                            height: 40,
                            child: state.isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: const Color(0xff6456EB),
                                  ))
                                : Text("No hay información para mostrar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xff6456EB),
                                        fontSize: 19,
                                        fontWeight: FontWeight.w400)),
                          )
                        : Column(
                            children: [
                              Expanded(
                                  child: SmartRefresher(
                                      enablePullDown: true,
                                      enablePullUp: true,
                                      controller: _refreshController,
                                      onRefresh: () async {
                                        BlocProvider.of<FriendsBloc>(context)
                                            .add(LoadRefreshFriends(
                                                context, userID));
                                        await Future.delayed(
                                            Duration(milliseconds: 1000));
                                        // if failed,use refreshFailed()
                                        _refreshController.refreshCompleted();
                                      },
                                      onLoading: () async {
                                        BlocProvider.of<FriendsBloc>(context)
                                            .add(LoadRefreshFriends(
                                                context, userID));
                                        await Future.delayed(
                                            Duration(milliseconds: 1000));
                                        _refreshController.loadComplete();
                                      },
                                      child: items.length > 0
                                          ? ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              itemBuilder: (c, i) =>
                                                  _friendItem(i),
                                              itemCount: items.length,
                                              // ],
                                            )
                                          : Container()))
                            ],
                          )),
              ),
              GradientButton(
                  "Cerrar",
                  () => {Navigator.of(context, rootNavigator: true).pop()},
                  null)
            ],
          ));
    });
  }

  Widget serviceForm() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          Row(children: [Expanded(child: _firstName())]),
          Row(children: [Expanded(child: _lastName())]),
          Row(children: [Expanded(child: _identity())])
        ],
      ),
    );
  }

  Widget _firstName() {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        controller: _firstNameController,
        enabled: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
        decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Nombre',
            borderColor: Color(0xFFDFDDFD),
            sizeLabel: 13),
        validator: (value) => (value == null || value == '') ? '' : null,
      ),
    ));
  }

  Widget _lastName() {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        controller: _lastNameController,
        enabled: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
        decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Apellido',
            borderColor: Color(0xFFDFDDFD),
            sizeLabel: 13),
        validator: (value) => (value == null || value == '') ? '' : null,
      ),
    ));
  }

  Widget _identity() {
    return Container(
        child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        controller: _identityController,
        enabled: true,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
        decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Número de identificación',
            borderColor: Color(0xFFDFDDFD),
            sizeLabel: 13),
        validator: (value) => (value == null || value == '') ? '' : null,
      ),
    ));
  }

  _add_friend() {
    final blocFriends = BlocProvider.of<FriendsBloc>(context);
    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          blocFriends.add(ChangeFormFriends(value));
        });
      },
      trailing: Container(
        height: 31,
        width: 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(31),
          color: const Color(0xff867BFD),
        ),
        child: const Image(
          image: AssetImage('assets/images/iconAdd.png'),
        ),
      ),
      title: const Text(
        'Agregar Amigo',
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5C5D87)),
      ),
      children: <Widget>[
        Column(children: [
          serviceForm(),
          Container(
              margin: const EdgeInsets.only(
                  left: 38, top: 53, right: 38, bottom: 50),
              child: _buttonAddFriend()),
        ])
      ],
    );
  }

  confirmPopup(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45.0, bottom: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: SizedBox(
            height: 95.0,
            width: 117.0,
            child: ClipRRect(
                child: Image.asset(
              "assets/images/ok_check.png",
              isAntiAlias: true,
              fit: BoxFit.fill,
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 26.0),
            child: Text(
              "Amigo añadido exitosamente",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0),
            )),
        GradientButton("Aceptar",
            () => {Navigator.of(context, rootNavigator: true).pop()}, null)
      ],
    );
  }

  _onSubmit(state) async {
    FocusScope.of(context).unfocus();
    WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
    final friendsService = BlocProvider.of<FriendsBloc>(context);
    // Validate Form
    if (!_formKey.currentState!.validate()) return;
    final params = {
      "name": _firstNameController.text,
      "lastName": _lastNameController.text,
      "identity": _identityController.text,
    };
    friendsService.add(ChangeLoadingFriend(true));

    final dynamic response;
    response = await friendsService.friendsRepo.saveFriend(context, params);

    friendsService.add(ChangeLoadingFriend(false));
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      Friends newFriend =
          Friends.fromJson(json.decode(response.body)) as Friends;
      friendsService.add(LoadNewFriend(newFriend));
      _firstNameController.clear();
      _lastNameController.clear();
      _identityController.clear();
      Alert(
              context: context,
              content: confirmPopup(context),
              style: AlertStyle(isButtonVisible: false, isCloseButton: false))
          .show();
    }
  }

  Widget _buttonAddFriend() {
    return BlocBuilder<FriendsBloc, FriendsState>(builder: (context, state) {
      return MaterialButton(
          color: Color(0xFF776BF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: Color(0xff7E72FF),
            ),
          ),
          elevation: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                state.isLoading
                    ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        'Guardar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              ]),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff7B6FFA).withOpacity(0.34),
                    spreadRadius: 0,
                    blurRadius: 9,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              )),
          onPressed: () async {
            state.isLoading ? null : _onSubmit(state);
          });
    });
  }

  Widget _friendItem(int i) {
    String name_full = "";
    if (items[i].name != null) {
      name_full = items[i].name.toString();
    }
    if (items[i].lastName != null) {
      name_full += " " + items[i].lastName.toString();
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
          title: Text(
            name_full,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            items[i].identity != null ? items[i].identity.toString() : '',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
          ),
          onTap: () {
            BlocProvider.of<CommonZonesBloc>(context)
                .add(AddGuestReservation(context, items[i]));
          },
          trailing: Container(
            child: ElevatedButton(
              child: Icon(const IconData(0xe917, fontFamily: 'icomoon'),
                  size: 18, color: Color(0xFFF9FAFE)),
              onPressed: () {
                _deleteFriend(context, i);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 0),
                fixedSize: const Size(4, 4),
                shape: const CircleBorder(),
                primary: const Color(0xFF714CF6),
              ),
            ),
          )),
    );
  }

  void _deleteFriend(BuildContext context, int i) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el amigo?'),
            actions: [
              TextButton(
                  onPressed: () {
                    BlocProvider.of<FriendsBloc>(context)
                        .add(DeleteFriend(context, items[i].id.toString()));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Si')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
}
