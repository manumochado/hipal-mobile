import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/pets/bloc/pets_bloc.dart';
import 'package:hipal/widgets/card_general.dart';

class GeneralPet extends StatelessWidget {
  const GeneralPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("***** Execute Load pets *****");
    print(LoadRefreshPets(context));
    BlocProvider.of<PetsBloc>(context).add(LoadRefreshPets(context));
    BlocProvider.of<PetsBloc>(context).add(ChangeIndex(0));
    print("***** End Load pets *****");

    return BlocBuilder<PetsBloc, PetsState>(builder: (context, state) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.zero,
              bottomLeft: Radius.circular(11.0),
              bottomRight: Radius.circular(11.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              children: [
                _pets(),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xffE0E5F1),
                )
              ],
            ),
          ));
    });
  }

  Widget _pets() {
    return BlocBuilder<PetsBloc, PetsState>(builder: (context, state) {
      var totalText =
          (state.pagination != null) ? state.pagination!.total.toString() : '0';
      print('total Text= $totalText');
      return CardGeneral(
          context: context,
          title: 'Mascotas registradas',
          subtitle: totalText,
          type: 'button',
          buttonText: 'Ver',
          isEnabled: state.pagination != null,
          // type: 'icon',
          // icon: const IconData(0xe90e, fontFamily: 'icomoon'),
          navigate: 'pets');
    });
  }
}
