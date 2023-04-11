import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/Management/advertisements/bloc/advertisements_bloc.dart';
import 'package:hipal/components/Management/advertisements/ui/widgets/documents_adversiments.dart';
import 'package:hipal/components/commonZones/ui/screens/form_reservation.dart';
import 'package:hipal/components/footer/widgets/bottomNavigationBar.dart';
import 'package:hipal/components/footer/widgets/floatingActionBtn.dart';
import 'package:intl/intl.dart';

class DetailsAdvertisements extends StatefulWidget {
  int i;
  DetailsAdvertisements(this.i, {Key? key}) : super(key: key);

  @override
  State<DetailsAdvertisements> createState() => _DetailsAdvertisementsState(i);
}

class _DetailsAdvertisementsState extends State<DetailsAdvertisements> {
  int i;
  _DetailsAdvertisementsState(this.i);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertisementsBloc, AdvertisementsState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtn(),
          bottomNavigationBar: BtnNavigationBar(key: Key("BottomHipal")),
          body: Stack(
            children: [
              Container(
                //width: 55.0,
                height: 310.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      state.advertisements![i].image!.url.toString(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35),
                child: IconButton(
                    color: Color(0xffFFFFFF),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, 'advertisementsScreen'),
                    icon: Icon(Icons.arrow_back, size: 25)),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.only(top: 290),
                decoration: BoxDecoration(
                  color: Color(0xFFF9FAFE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.advertisements![i].theme.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff897EFD)),
                      ),
                      _infoUser(),
                      Text(
                        state.advertisements![i].description.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Color(0xff6C7192)),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/vigencia.png',
                            width: 15,
                            height: 15,
                            color: Color(0xff8176FB),
                          ),
                          SizedBox(width: 10),
                          Text(
                            state.advertisements![i].date != null
                                ? 'publicado el dia ${DateFormat('dd/MM/yyyy').format(state.advertisements![i].date as DateTime)}'
                                : '',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Color(0xff5C5D87)),
                          ),
                        ],
                      ),
                      _btnNextFile()
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _btnNextFile() {
    return Container(
      width: double.infinity,
      height: 53,
      margin: EdgeInsets.only(top: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: Color(0xff7E72FF),
          ),
        ),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Color(0xFF776BF8),
        child: Container(
          //padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
          child: Text(
            'Documentos gestión del administrador',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(0xff7B6FFA).withOpacity(0.34),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
        ),
        onPressed: () {
          //print(BlocProvider.of<CommonZonesBloc>(context).state.reservation);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DocumentsAdversiments(i)));
        },
      ),
    );
  }

  Widget _infoUser() {
    return BlocBuilder<AdvertisementsBloc, AdvertisementsState>(
      builder: (context, state) {
        return Container(
          child: state.advertisements != null
              ? ListTile(
                  leading: Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: state.advertisements![i].users!.photo?.url !=
                                    ""
                                ? NetworkImage(state
                                    .advertisements![i].users!.photo!.url
                                    .toString())
                                : AssetImage('assets/images/image-default.png')
                                    as ImageProvider,
                          ))),
                  title: Text(
                    state.advertisements != null
                        ? '${state.advertisements![i].users?.firstname} ${state.advertisements![i].users?.lastname}'
                            .toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff343887),
                        fontSize: 13),
                  ),
                  subtitle: Text(
                    state.advertisements![i].residential?.name != null
                        ? 'Administrador ${state.advertisements![i].residential?.name}'
                            .toString()
                        : '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB1B4C7),
                        fontSize: 13),
                  ),
                )
              : Text(
                  '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                      fontSize: 13),
                ),
        );
      },
    );
  }
}
