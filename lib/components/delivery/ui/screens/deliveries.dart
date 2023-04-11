import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/delivery/bloc/addres_deliveries_bloc/address_deliveries_bloc.dart';
import 'package:hipal/components/delivery/bloc/deliveries_bloc/deliveries_bloc.dart';

import 'package:hipal/components/delivery/model/delivery.dart';
import 'package:hipal/components/delivery/repository/deliveries_repository.dart';
import 'package:hipal/components/delivery/ui/widgets/list.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:hipal/widgets/appbar_back_search.dart';

import '../widgets/list_address.dart';

class DeliveryScreens extends StatefulWidget {
  @override
  _DeliveryScreens createState() => _DeliveryScreens();
}

class _DeliveryScreens extends State<DeliveryScreens> {
  List<Delivery> items = [];
  final _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DeliveriesBloc>(context)
        .add(LoadRefreshDeliveries(context));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      Navigator.pushReplacementNamed(context, "dashboard");
      return Future.value(true);
    }, child:
        BlocBuilder<DeliveriesBloc, DeliveriesState>(builder: (context, state) {
      items = (state.deliveries != null ? state.deliveries : [])!;
      return Scaffold(
        appBar: AppBarBackSearch(
          color_buttons: 0xFF8075FB,
          color_title: 0xFF8075FB,
          name_title: 'Domicilios',
          color_background: 0xFFFFFFFF,
          with_search: false,
          view: 'dashboard',
        ),
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                  height: 180, color: Colors.white, child: DeliveryList()),
              _shearOrderFile(),
              _subtitleFile(),
              Container(
                  margin: EdgeInsets.only(top: 250),
                  child: AddressDeliveryList())
            ],
          ),
        ),
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: false,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionBtn(),
        bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
      );
    }));
  }

  Widget _shearOrderFile() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 133),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(left: 23),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              hintText: '¿Qué quieres pedir hoy?',
              suffixIcon: IconButton(
                iconSize: 20,
                icon: Image.asset('assets/images/iconSearch.png',
                    color: const Color(0xff8075FB)),
                onPressed: () {
                  BlocProvider.of<AddressDeliveriesBloc>(context)
                      .add(searchAddressDirectory(context, _controller.text));
                },
              ),
              border: InputBorder.none),
        ),
      ),
    );
  }

  Widget _subtitleFile() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 200),
      child: const Text(
        'Conoces una tienda cercana, ¡Recuerda en pasarle la información a la recepción para que lo agregue al directorio!',
        style: TextStyle(color: Color(0xff5F5E88), fontSize: 13),
        textAlign: TextAlign.center,
      ),
    );
  }
}
