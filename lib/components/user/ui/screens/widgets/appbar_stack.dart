import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/components/user/ui/screens/widgets/personal_information.dart';
import 'package:hipal/components/user/ui/screens/widgets/security_information.dart';
import 'package:hipal/components/user/ui/screens/widgets/title_property_information.dart';
import 'package:hipal/widgets/border_line.dart';
import 'package:hipal/widgets/user_info.dart';

class AppBarStack extends StatelessWidget {
  final String? title;
  final Color? colorBack;
  final String pageBack;
  final bool leadingBack;

  const AppBarStack({
    Key? key,
    this.title,
    this.colorBack,
    this.pageBack = '',
    this.leadingBack = true,
    // this.tabController,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement build
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xffF9FAFE),
        appBar: AppBar(
          elevation: 0,
          title: Text('Mi cuenta'),
          centerTitle: true,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: leadingBack
              ? BackButton(
                  color: colorBack != null ? colorBack : Color(0xffffffff),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, pageBack);
                  },
                )
              : null,
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Container(
                height: 265,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0, 0.5),
                    colors: [Color(0xFF6456EB), Color(0xFF8639D8)],
                  ),
                ),
              ),
              ListView(
                children: [
                  Container(
                      margin:
                          const EdgeInsets.only(left: 20, top: 28, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserInfo(0xFFFFFFFF, 0xFFDBCCF6, 230),
                          
                        ],
                      )),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(31)),
                    margin: EdgeInsets.only(
                        top: 18, left: 28, right: 28, bottom: 33),
                    padding: const EdgeInsets.only(top: 20.0, bottom: 38.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            width: 37,
                            height: 37,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF8C81FE),
                                    Color(0xFF776BF8)
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(123, 111, 250, 0.55),
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              const IconData(
                                0xe920,
                                fontFamily: 'icomoon',
                              ),
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          title: const Text(
                            'Información personal',
                            style: TextStyle(
                                color: Color(0xff8378FC),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),

                          trailing: InkWell(
                            onTap: () {
                              context
                                    .read<UserBloc>()
                                    .add(ChangeUsers2(state.userInfo!));
                                    Navigator.of(context, rootNavigator: true)
                                    .pushReplacementNamed("edit-user");
                            },
                            child: Container(
                              height: 31.9,
                              width: 82.5,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(231, 228, 251, 1),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    color: Color.fromRGBO(133, 133, 133, 1),
                                )
                                ],
                                borderRadius: BorderRadius.circular(2.55),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 9,
                                    right: 35,
                                    child: Text('Editar', style: TextStyle(fontSize: 12.75, color: Color(0xff8378FC), fontWeight: FontWeight.w700),)),
                          
                              Positioned(
                                left: 55,
                                top: 9,
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Center(
                                    child: Image.asset(
                                        'assets/icons/iconEdit.png',
                                        
                                        fit: BoxFit.fill,
                                        color: Color(0xFF8378FC),
                                      ),
                                     
                                  ),
                                ),
                              )
                                ],
                              ),
                            ),
                          ),
                        ),
                        PersonalInformation(
                          fieldactive: false,
                        ),

                        
                      ],
                    ),
                  ),

                
                  TitlePropertyInformation(),
                  SecurityInformation(),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _titleSocialMedia() {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      child: ListTile(
        leading: Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(123, 111, 250, 0.55),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            const IconData(
              0xe924,
              fontFamily: 'icomoon',
            ),
            color: Colors.white,
            size: 22.0,
          ),
        ),
        title: const Text(
          'Redes sociales',
          style: TextStyle(
              color: Color(0xff8378FC),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _instagram() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String social = "";
      if (state.userInfo?.user?.socialNetworks != null) {
        if (state.userInfo!.user!.socialNetworks!.length > 0) {
          for (var item in state.userInfo!.user!.socialNetworks!) {
            if (item.split(" ")[0] == "Instagram") {
              social = item.split(" ")[1];
            }
          }
        }
      }
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: ListTile(
            leading: Container(
              width: 24,
              height: 24,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Icon(
                const IconData(
                  0xe927,
                  fontFamily: 'icomoon',
                ),
                color: Color.fromRGBO(123, 111, 250, 1),
                size: 17.0,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Instagram',
                  style: TextStyle(
                      color: Color(0xff5C5D87),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 153,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      width: 1.5,
                      color: Color.fromRGBO(177, 180, 199, 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      social,
                      style: TextStyle(
                          color: Color(0xff5C5D87),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }

  Widget _facebook() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String social = "";
      if (state.userInfo?.user?.socialNetworks != null) {
        if (state.userInfo!.user!.socialNetworks!.length > 0) {
          for (var item in state.userInfo!.user!.socialNetworks!) {
            if (item.split(" ")[0] == "Facebook") {
              social = item.split(" ")[1];
            }
          }
        }
      }
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: ListTile(
            leading: Container(
              width: 24,
              height: 24,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Icon(
                const IconData(
                  0xe928,
                  fontFamily: 'icomoon',
                ),
                color: Color.fromRGBO(123, 111, 250, 1),
                size: 17.0,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Facebook',
                  style: TextStyle(
                      color: Color(0xff5C5D87),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 153,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      width: 1.5,
                      color: Color.fromRGBO(177, 180, 199, 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      social,
                      style: TextStyle(
                          color: Color(0xff5C5D87),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }

  Widget _youtube() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String social = "";
      if (state.userInfo?.user?.socialNetworks != null) {
        if (state.userInfo!.user!.socialNetworks!.length > 0) {
          for (var item in state.userInfo!.user!.socialNetworks!) {
            if (item.split(" ")[0] == "Youtube") {
              social = item.split(" ")[1];
            }
          }
        }
      }
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: ListTile(
            leading: Container(
              width: 26,
              height: 24,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Icon(
                const IconData(
                  0xe929,
                  fontFamily: 'icomoon',
                ),
                color: Color.fromRGBO(123, 111, 250, 1),
                size: 17.0,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Youtube',
                  style: TextStyle(
                      color: Color(0xff5C5D87),
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 153,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      width: 1.5,
                      color: Color.fromRGBO(177, 180, 199, 1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      social,
                      style: TextStyle(
                          color: Color(0xff5C5D87),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }
}
