import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/delivery/bloc/addres_deliveries_bloc/address_deliveries_bloc.dart';
import 'package:hipal/components/delivery/bloc/deliveries_bloc/deliveries_bloc.dart';
import 'package:hipal/components/delivery/model/addressDelivery.dart';
import 'package:hipal/components/delivery/ui/widgets/details_deliveries.dart';
import 'package:hipal/widgets/border_line.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class AddressDeliveryList extends StatefulWidget {
  AddressDeliveryList({Key? key}) : super(key: key);

  @override
  State<AddressDeliveryList> createState() => _AddressDeliveryListState();
}

class _AddressDeliveryListState extends State<AddressDeliveryList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<AddressDelivery> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressDeliveriesBloc, AddressDeliveriesState>(
      builder: (context, state) {
        items = state.addressDeliveries != null ? state.addressDeliveries! : [];

        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: () async {
            BlocProvider.of<AddressDeliveriesBloc>(context)
                .add(LoadAddressRefreshDeliveries(context, state.type));
            await Future.delayed(Duration(milliseconds: 1000));
            // if failed,use refreshFailed()
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            BlocProvider.of<AddressDeliveriesBloc>(context)
                .add(LoadMoreAddressDeliveries(context));
            await Future.delayed(Duration(milliseconds: 1000));

            _refreshController.loadComplete();
          },
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, i) {
              return _deliveryCard(i);
            },
          ),
        );
      },
    );
  }

  Widget _deliveryCard(int i) {
    void launchWhatsapp({@required number, @required message}) async {
      String rout = "https://api.whatsapp.com/send?phone=$number&text=$message";
      // ignore: deprecated_member_use
      await canLaunch(rout)
          // ignore: deprecated_member_use
          ? launch(rout)
          : print(' no se pudo abrir whatsapp $rout ');
    }

    return BlocBuilder<AddressDeliveriesBloc, AddressDeliveriesState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        return Column(
          children: [
            Card(
              elevation: 0,
              color: Color(0xffFFFFFF),
              child: ListTile(
                onTap: () {
                  final idParams = items[i].id.toString();
                  final name = items[i].name.toString();
                  final urlImage = items[i].photo!.url;
                  final phone = items[i].phone.toString();
                  final qualifiers = items[i].qualifiers;
                  final score = items[i].score;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsDeliveries(idParams, name,
                            urlImage, phone, qualifiers, score)),
                  );
                },
                leading: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xff6456EB),
                    image: DecorationImage(
                      image: NetworkImage(items[i].photo?.url != null
                          ? items[i].photo!.url.toString()
                          : ''),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(19),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '${items[i].name.toString()}',
                    style: const TextStyle(
                        color: Color(0xff5C5D87),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        items[i].address.toString(),
                        style: const TextStyle(
                            color: Color(0xff5F5E88),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                    Row(
                      children: [
                        const Flexible(
                          child: Text(
                            'Calificación:    ',
                            style: TextStyle(
                                color: Color(0xff9FA7B8),
                                fontWeight: FontWeight.bold,
                                fontSize: 11),
                          ),
                        ),
                        const Flexible(
                          child: Icon(
                            Icons.star,
                            size: 15,
                            color: Color(0xffF4B942),
                          ),
                        ),
                        Text(
                          (() {
                            if (items[i].qualifiers.toString() == 'null') {
                              return ' 0';
                            } else {
                              return ' ${items[i].qualifiers.toString()}';
                            }
                          })(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            gradient: const LinearGradient(
                              colors: [Color(0xff8C81FE), Color(0xff776BF8)],
                            ),
                          ),
                          child: IconButton(
                              icon: Image.asset(
                                  'assets/images/iconTelephone.png'),
                              onPressed: () async {
                                FlutterPhoneDirectCaller.callNumber(
                                    items[i].phone.toString());
                              }
                              //child: Text('Call Number'),
                              )),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 37,
                          height: 37,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            gradient: const LinearGradient(
                              colors: [Color(0xffE3E3E3), Color(0xffD8D8E3)],
                            ),
                          ),
                          child: IconButton(
                            icon: Image.asset('assets/images/iconWhassapp.png'),
                            onPressed: () {
                              launchWhatsapp(
                                  number: "${items[i].phone.toString()}",
                                  message:
                                      "Biemvenidos a ${items[i].name.toString()}");
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
            BorderLine(3, 10, 10, 0xffF0F0F7)
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
