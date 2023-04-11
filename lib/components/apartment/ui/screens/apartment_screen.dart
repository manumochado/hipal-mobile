import 'package:flutter/material.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/components/menu/ui/menu.dart';
import 'package:hipal/widgets/leading.dart';

import '../../../employees/ui/screens/general.dart';
import '../../../families/ui/screens/general.dart';
import '../../../myservices/ui/widgets/aparment_service/aparment_service.dart';
import '../../../pets/ui/screens/general.dart';
import '../../../vehicles/ui/screens/general.dart';
import '../../property/ui/screens/property.dart';
import '../widgets/card_header.dart';
import '../widgets/card_item.dart';

class ApartmentScreen extends StatelessWidget {
  const ApartmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async {
          Navigator.pushReplacementNamed(context, "dashboard");
          return Future.value(true);
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Mi apartamento'),
            centerTitle: true,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            leading: LeadingHipal(),
          ),
          backgroundColor: Color(0xffF9FAFE),
          drawer: DrawerMainMenu(),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: CardHeader(),
              ),
              SizedBox(height: 16.0),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CardItemApartment(
                          title: 'Mi propiedad',
                          icon: const IconData(0xe915, fontFamily: 'icomoon'),
                          content: Property(),
                        ),
                        CardItemApartment(
                          title: 'Mis servicios',
                          icon: const IconData(0xe914, fontFamily: 'icomoon'),
                          content: ApartmentService(),
                        ),
                        CardItemApartment(
                          title: 'Mi familia',
                          icon: const IconData(0xe913, fontFamily: 'icomoon'),
                          content: GeneralFamily(),
                        ),
                        CardItemApartment(
                          title: 'Mis mascotas',
                          icon: const IconData(0xe912, fontFamily: 'icomoon'),
                          content: GeneralPet(),
                        ),
                        CardItemApartment(
                          title: 'Mis vehículos',
                          icon: const IconData(0xe911, fontFamily: 'icomoon'),
                          content: GeneralVehicle(),
                        ),
                        CardItemApartment(
                          title: 'Mis empleados',
                          icon: const IconData(0xe910, fontFamily: 'icomoon'),
                          content: GeneralEmployee(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          //extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
        ));
  }
}
