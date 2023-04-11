import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/ui/widgets/rules_assembly.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/utils/extension_color.dart';

// ignore: must_be_immutable
class WelcomeAssembly extends StatefulWidget {
  
  WelcomeAssembly({Key? key}) : super(key: key);

  @override
  State<WelcomeAssembly> createState() => _WelcomeAssemblyState();
}

class _WelcomeAssemblyState extends State<WelcomeAssembly> {
  

  _WelcomeAssemblyState();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentlyAssemblyBloc, CurrentlyAssemblyState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: 307,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iconAssembly.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              

              Container(
                height: 307,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(1.0, 2.0),
                    colors: [
                       Color(0xff46267e).withOpacity(0.5),
                       Color(0xff46267e).withOpacity(0.8),
                    ],
                  ),
                ),
                

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/logo2.svg', width: 157, height: 95, fit: BoxFit.fill,),

                    SizedBox(height: 25,),

                    Image.asset('assets/images/rect.png', width: 129, height: 36,  fit: BoxFit.fill,),

                    SizedBox(height: 2),

                    Text(
                      'Nombre Copropiedad',
                      style: TextStyle(
                        fontFamily: 'BasicCommercial LT Light',
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),

              InkWell(
                onTap: () => {
                  Navigator.pop(context)
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 40),
                  alignment: Alignment.topLeft,
                  height: 150,
                  width: 50,
                  child: Image.asset('assets/images/backarrow.png')
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                margin: EdgeInsets.only(top: 275),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 110),
                    Text(
                      'Bienvenido a la Asamblea',
                      style: TextStyle(
                        fontFamily: 'BasicCommercial LT Light',
                        color: Color(0xff897EFD),
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Text(
                      'online copropietarios 2021',
                      style: TextStyle(
                        fontFamily: 'BasicCommercial LT Light',
                        color: Color(0xff897EFD),
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 26),

                    Text(
                      'Participa de la Asamblea, haciendo clic aquí',
                      style: TextStyle(
                        fontFamily: 'BasicCommercial LT Light',
                        color: Color(0xff6C7192),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 46),

                    InkWell(
                      onTap: () => {
                        Navigator.pushNamed(context, 'gral-assembly-screen')
                      },
                      child: Container(
                      height: 53,
                      width: 339,
                      decoration: BoxDecoration(
                        color: '#8378FC'.toColor(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Ingresar',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                                      ),
                    )

                    
                  ]
                ),
              )
            ],
          ),
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        );
      },
    );
  }
}
