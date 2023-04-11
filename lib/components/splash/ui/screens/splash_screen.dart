import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:hipal/services/http.dart';

import 'package:hipal/notifications/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../user/bloc/user_bloc.dart';
import '../../../user/model/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  double _scaleX = 0.5;
  double _scaleY = 0.5;

  @override
  void initState() {
    HttpService httpService;
    Future.delayed(
      const Duration(milliseconds: 2000),
      () async {
        httpService = new HttpService(context);
        final token = await httpService.readToken();
        if(token != ''){
          Navigator.pushReplacementNamed(context, 'dashboard');

          // final firebaseMessaging = FCM();
          // firebaseMessaging.setNotifications(context);
        }else{
          Navigator.pushReplacementNamed(context, 'login');
        }
      },
    );
    super.initState();
  }

  @override
  MaterialApp build(BuildContext context){
    //Se corrige el error de llamar el setState durante un build
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
       setState(() {
          _scaleX = 1.0;
          _scaleY = 1.0;
        });
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash_screen.png'),
                fit: BoxFit.cover),
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 80),
            child: Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                transform: (
                  Matrix4.identity()
                  ..scale(_scaleX, _scaleY)
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/splash_logo.png'),
                    fit: BoxFit.contain
                  )
                )
              )
            )
          )
        ),
      ),
    );

  }

}
