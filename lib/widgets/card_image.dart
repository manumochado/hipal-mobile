import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../components/user/bloc/user_bloc.dart';

class CardImage extends StatelessWidget {
  final dynamic border;
  final dynamic titleStyle;
  final dynamic colorTitle;
  final dynamic borderRadius;
  final dynamic descriptionStyle;
  final dynamic colorDescription;
  final dynamic width;
  final dynamic isHome;

  CardImage({
    Key? key,
    this.border,
    this.borderRadius,
    this.titleStyle,
    this.colorTitle,
    this.colorDescription,
    this.descriptionStyle,
    this.width,
    this.isHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String name = "";
      String descrip = "";
      double marginTop = this.isHome ? 25.0 : 50.0;
      if (state.userInfo?.user?.firstname != null) {
        name += state.userInfo!.user!.firstname.toString();
      }
      if (state.userInfo?.user?.lastname != null) {
        name += " " + state.userInfo!.user!.lastname.toString();
      }
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
          height: 100.0,
          width: width == null ? 245.0 : width - 270,
          child: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(color: Color(0xFF8639D8)),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Expanded(
                        flex: 10,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 55.0,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                color: const Color(0xfff3f0f0),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                                width: 50.0,
                                height: 50.0,
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
                      ),
                      Expanded(
                        flex: 40,
                        child: Container(
                            margin: EdgeInsets.only(left: 11, top: marginTop),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      color: colorTitle != null
                                          ? Color(colorTitle)
                                          : Color(0xff343887),
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    descrip,
                                    style: TextStyle(
                                      color: colorDescription != null
                                          ? Color(colorDescription)
                                          : Color(0xff343887),
                                      fontSize: 15,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  )
                                ])),
                      ),
                      if (this.isHome)
                        Expanded(
                          flex: 20,
                          child: SvgPicture.asset('assets/icons/Hi_globo.svg',
                              width: 100, semanticsLabel: 'Hipal Logo'),
                        )
                    ]));
    });
  }
}
