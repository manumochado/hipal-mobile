import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/user/bloc/user_bloc.dart';

class UserInfo extends StatelessWidget {
  int color_user_name;
  double width_name;
  int color_info;

  UserInfo(this.color_user_name, this.color_info, this.width_name);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String fullName = "";
      if (state.userInfo?.user?.firstname != null) {
        fullName = state.userInfo!.user!.firstname.toString();
      }
      if (state.userInfo?.user?.firstname != null) {
        fullName += " " + state.userInfo!.user!.lastname.toString();
      }
      String descrip = "";
      if (state.userInfo?.apartment?.tower != null) {
        descrip = state.userInfo!.apartment!.tower!.name.toString() + ",";
      }
      if (state.userInfo?.apartment != null) {
        descrip += state.userInfo!.apartment!.name.toString();
      }
      String url = "";
      if (state.userInfo?.user?.photo != null) {
        url = state.userInfo!.user!.photo!.url.toString();
      }
      return Container(
        height: 58.0,
        width: size.width,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 58,
                height: 58,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Container(
                    width: 58,
                    height: 58,
                    margin: EdgeInsets.all(2.0),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: new DecorationImage(
                          fit: BoxFit.contain,
                          image: url != ""
                              ? NetworkImage(url)
                              : AssetImage('assets/images/image-default.png')
                                  as ImageProvider,
                        )))),
            SizedBox(width: 10.0),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(fullName,
                          style: TextStyle(
                            color: Color(color_user_name),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),
                    Text(descrip,
                        style: TextStyle(
                          color: Color(color_info),
                          fontSize: 15,
                        ))
                  ]),
            ),
          ],
        ),
      );
    });
  }

  // ignore: body_might_complete_normally_nullable
  static UserInfo? fromJson(Map<String, dynamic> userDecode) {}
}
