import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/delivery/bloc/addres_deliveries_bloc/address_deliveries_bloc.dart';
import 'package:hipal/components/delivery/bloc/deliveries_bloc/deliveries_bloc.dart';
import 'package:hipal/components/delivery/model/delivery.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DeliveryList extends StatefulWidget {
  DeliveryList({Key? key}) : super(key: key);

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Delivery> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveriesBloc, DeliveriesState>(
        builder: (context, state) {
      items = (state.deliveries != null ? state.deliveries : [])!;

      if (items.length != 0) {
        BlocProvider.of<AddressDeliveriesBloc>(context)
            .add(LoadAddressRefreshDeliveries(context, items[0].id.toString()));
      }

      return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: () async {
            BlocProvider.of<DeliveriesBloc>(context)
                .add(LoadRefreshDeliveries(context));
            await Future.delayed(Duration(milliseconds: 1000));
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            BlocProvider.of<DeliveriesBloc>(context)
                .add(LoadMoreDeliveries(context));
            await Future.delayed(Duration(milliseconds: 1000));

            _refreshController.loadComplete();
          },
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (contex, i) {
                return _deliveryCard(i);
              }));
    });
  }

  Widget _deliveryCard(int i) {
    return BlocBuilder<DeliveriesBloc, DeliveriesState>(
        builder: (context, state) {
      if (i <= items.length - 1) {
        return Container(
          height: 150,
          margin: const EdgeInsets.only(top: 30, left: 3),
          child: Column(
            children: [
              MaterialButton(
                onPressed: (() async {
                  BlocProvider.of<AddressDeliveriesBloc>(context).add(
                      LoadAddressRefreshDeliveries(
                          context, items[i].id.toString()));
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 63,
                      height: 63,
                      decoration: BoxDecoration(
                        color: const Color(0xff6456EB),
                        image: DecorationImage(
                          image: NetworkImage(items[i].image?.url != null
                              ? items[i].image!.url.toString()
                              : ''),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(63),
                      ),
                    ),
                    Text(
                      items[i].name.toString(),
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff343887)),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
