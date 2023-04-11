import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/families/bloc/formfamily_bloc.dart';

import 'package:hipal/components/families/bloc/families_bloc.dart';
import 'package:hipal/components/families/model/family.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FamiliesList extends StatefulWidget {
  @override
  _FamiliesList createState() => _FamiliesList();
}

class _FamiliesList extends State<FamiliesList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Family> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FamiliesBloc, FamiliesState>(builder: (context, state) {
      items = (state.families != null ? state.families : [])!;

      return state.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: const Color(0xff6456EB),
              ),
            )
          : SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: () async {
                BlocProvider.of<FamiliesBloc>(context)
                    .add(LoadRefreshFamilies(context));
                await Future.delayed(Duration(milliseconds: 1000));
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                BlocProvider.of<FamiliesBloc>(context)
                    .add(LoadMoreFamilies(context));
                await Future.delayed(Duration(milliseconds: 1000));
                _refreshController.loadComplete();
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (c, i) => _familyCard(i),
                itemCount: items.length,
              ));
    });
  }

  void _deleteFamily(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el familiar?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    BlocProvider.of<FamiliesBloc>(context)
                        .add(DeleteFamily(context, id));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Si')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  Widget _imgFam(String url) {
    Widget img;
    try {
      img = CachedNetworkImage(
        fit: BoxFit.contain,
        width: 50,
        height: 50,
        imageUrl: url,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => _bgPurple(),
      );
    } catch (error) {
      img = _bgPurple();
    }
    return img;
  }

  Widget _bgPurple() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xff6456EB),
        borderRadius: BorderRadius.all(Radius.circular(19.0)),
      ),
    );
  }

  Widget _familyCard(int i) {
    return BlocBuilder<FamiliesBloc, FamiliesState>(builder: (context, state) {
      if (i <= items.length - 1) {
        var type =
            items[i].type!.name != null ? items[i].type!.name.toString() : '';

        return Card(
          child: ListTile(
            leading: (items[i].image == null || items[i].image == '')
                ? _bgPurple()
                : _imgFam(items[i].image!.url.toString()),
            title: Text(
              items[i].name != null ? items[i].name.toString() : '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('$type'),
            onTap: () => {},
            trailing: PopupMenuButton(
                icon: Icon(const IconData(0xe91a, fontFamily: 'icomoon'),
                    color: Color(0xff8378FC)),
                offset: Offset(-25, 18),
                onSelected: (optionValue) => {
                      if (optionValue == 1)
                        {_deleteFamily(context, items[i].id.toString())}
                      else if (optionValue == 0)
                        {
                          BlocProvider.of<FormfamilyBloc>(context)
                              .add(EditFamily(context, items[i])),
                          BlocProvider.of<FamiliesBloc>(context)
                              .add(ChangeIndex(1))
                        }
                    },
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(child: Text('Editar'), value: 0),
                      const PopupMenuItem(child: Text('Eliminar'), value: 1),
                    ]),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
