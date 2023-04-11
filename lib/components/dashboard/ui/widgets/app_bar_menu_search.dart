import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/bloc/user_bloc.dart';

class AppBarMenuSearch extends StatefulWidget with PreferredSizeWidget {
  int color_buttons;
  int color_background;

  AppBarMenuSearch(this.color_buttons, this.color_background);

  @override
  // Todo implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() {
    // Todo implement createState
    return _AppBarMenuSearch(color_buttons, color_background);
  }
}

class _AppBarMenuSearch extends State<AppBarMenuSearch> {
  int color_buttons;
  int color_background;
  bool isSearching = false;

  _AppBarMenuSearch(this.color_buttons, this.color_background);

  @override
  Widget build(BuildContext context) {
    // Todop implement build
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String? nameRes = "";
      if (state.userInfo?.apartment?.tower?.residential?.name != null) {
        nameRes = state.userInfo?.apartment?.tower?.residential?.name;
      }
      return AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            const IconData(0xe905, fontFamily: 'icomoon'),
            color: Color(0xffffffff),
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        elevation: 0,
        title: Text(
          nameRes ?? '',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      );
    });
  }
}
