import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/families/bloc/families_bloc.dart';
import 'package:hipal/widgets/card_general.dart';

class GeneralFamily extends StatelessWidget {
  const GeneralFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FamiliesBloc>(context).add(LoadFamilies(context));
    BlocProvider.of<FamiliesBloc>(context).add(ChangeIndex(0));

    return BlocBuilder<FamiliesBloc, FamiliesState>(builder: (context, state) {
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
                state.isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: const Color(0xff6456EB),
                          ),
                        ),
                      )
                    : _families(),
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

  Widget _families() {
    return BlocBuilder<FamiliesBloc, FamiliesState>(builder: (context, state) {
      print("state ${state.pagination}");
      var totalText =
          (state.pagination != null) ? state.pagination!.total.toString() : '0';
      return CardGeneral(
          context: context,
          title: 'Total integrantes',
          subtitle: totalText,
          type: 'button',
          buttonText: 'Ver',
          isEnabled: state.pagination != null,
          // type: 'icon',
          // icon: const IconData(0xe90e, fontFamily: 'icomoon'),
          navigate: 'families');
    });
  }
}
