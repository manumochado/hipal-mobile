import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/pets/bloc/formpet_bloc.dart';

import 'package:hipal/components/pets/bloc/pets_bloc.dart';
import 'package:hipal/components/pets/model/pet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PetsList extends StatefulWidget {
  @override
  _PetsList createState() => _PetsList();
}

class _PetsList extends State<PetsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Pet> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsBloc, PetsState>(builder: (context, state) {
      items = (state.pets != null ? state.pets : [])!;
      print("tamaño de items ${items.length}");

      return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: () async {
            BlocProvider.of<PetsBloc>(context).add(LoadRefreshPets(context));
            await Future.delayed(Duration(milliseconds: 1000));
            // if failed,use refreshFailed()
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            BlocProvider.of<PetsBloc>(context).add(LoadMorePets(context));
            await Future.delayed(Duration(milliseconds: 1000));

            _refreshController.loadComplete();
          },
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (c, i) => _petCard(i),
            itemCount: items.length,
            // ],
          ));
    });
  }

  void _deletePet(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar la mascota?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    BlocProvider.of<PetsBloc>(context)
                        .add(DeletePet(context, id));
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

  Widget _petCard(int i) {
    return BlocBuilder<PetsBloc, PetsState>(builder: (context, state) {
      print(items.length);
      if (i <= items.length - 1) {
        var type =
            items[i].type!.name != null ? items[i].type!.name.toString() : '';
        print(type);
        var race = items[i].race.toString() != ''
            ? '- ' + items[i].race.toString()
            : '';
        print(race);
        return Card(
          child: ListTile(
            leading: (items[i].image == null || items[i].image == '')
                ? Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff6456EB),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  )
                : Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff6456EB),
                      image: DecorationImage(
                        image: NetworkImage(items[i].image!.url != null
                            ? items[i].image!.url.toString()
                            : ''),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    ),
                  ),
            title: Text(
              items[i].name != null ? items[i].name.toString() : '',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('$type $race'),
            onTap: () => {},
            trailing: PopupMenuButton(
                icon: Icon(const IconData(0xe91a, fontFamily: 'icomoon'),
                    color: Color(0xff8378FC)),
                offset: Offset(-25, 18),
                onSelected: (optionValue) => {
                      if (optionValue == 1)
                        {_deletePet(context, items[i].id.toString())}
                      else if (optionValue == 0)
                        {
                          BlocProvider.of<FormpetBloc>(context)
                              .add(EditPet(context, items[i])),
                          BlocProvider.of<PetsBloc>(context).add(ChangeIndex(1))
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
