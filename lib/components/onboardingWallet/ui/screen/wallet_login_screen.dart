import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hipal/utils/extension_color.dart';

import '../../../user/bloc/user_bloc.dart';

class WalletLoginScreen extends StatefulWidget {
  const WalletLoginScreen({Key? key}) : super(key: key);

  @override
  _WalletLoginScreenState createState() => _WalletLoginScreenState();
}

class _WalletLoginScreenState extends State<WalletLoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String url = "";
      if (state.userInfo?.user?.photo != null) {
        url = state.userInfo!.user!.photo!.url.toString();
      }
      String name = "";
      if (state.userInfo?.user?.firstname != null) {
        name += state.userInfo!.user!.firstname.toString();
      }
      return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bg-wallet1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        ("#6456EB".toColor() as Color).withOpacity(0.8),
                        ("#8639D8".toColor() as Color).withOpacity(0.8),
                      ],
                    )),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Center(
                              child: SvgPicture.asset(
                                  'assets/icons/Hi_globo.svg',
                                  width: 100,
                                  semanticsLabel: 'Hipal Logo')),
                        ),
                        SizedBox(height: 50.0),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: new BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                )),
                            Container(
                                width: 65.0,
                                height: 65.0,
                                decoration: new BoxDecoration(
                                    color: const Color(0xff6456EB),
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: url != ""
                                          ? NetworkImage(url)
                                          : AssetImage(
                                                  'assets/images/image-default.png')
                                              as ImageProvider,
                                    ))),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Juan Andrés",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w900),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80.0, vertical: 40.0),
                          child: TextFormField(
                            autofocus: true,
                            onChanged: (value) {},
                            autocorrect: false,
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                labelText: 'Clave',
                                hintText: "****",
                                hintStyle: TextStyle(color: Colors.white),
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          width: width / 2 - 40,
                          height: 65.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.white],
                              ),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(123, 111, 250, 0.34),
                                    blurRadius: 9,
                                    offset: Offset(0, 5)),
                              ]),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, 'wallet');
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent),
                            child: Text(
                              "Ingresar",
                              style: TextStyle(
                                  color: "#8639D8".toColor(),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16.0),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Center(
                                child: Image.asset(
                              'assets/images/bg_face.png',
                              width: 100,
                            )),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, 'recoveryWallet');
                          },
                          child: Text(
                            '¿Olvidaste tu clave?',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 20.0,
                      left: 20.0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white, size: 30.0),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'dashboard');
                        },
                      )),
                ],
              )));
    });
  }
}
