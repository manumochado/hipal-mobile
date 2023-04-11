import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user/bloc/user_bloc.dart';
import '../../../bloc/property_cubit.dart';
import '../../../model/ApartamentUpdate.dart';
import '../../../ui/widgets/form_input.dart';
import '../../../ui/widgets/form_parqueadero.dart';

class Property extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Property();
  }
}

class _Property extends State<Property> {
  late PropertyCubit _propertyCubit;
  late GlobalKey<FormState> _propertyFormKey;
  late GlobalKey<FormState> _aparcamentoFormKey;

  @override
  void initState() {
    super.initState();
    _propertyFormKey = GlobalKey<FormState>();
    _aparcamentoFormKey = GlobalKey<FormState>();
    _propertyCubit = BlocProvider.of<PropertyCubit>(context);
    String idApart = BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.id.toString();
    BlocProvider.of<PropertyCubit>(context)
        .loadApartamentInfo(idApart, context);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return BlocBuilder<PropertyCubit, PropertyState>(builder: (context, state) {
      return Stack(alignment: Alignment.center, children: [
        Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(11.0),
                bottomRight: Radius.circular(11.0),
              ),
            ),
            child: Column(children: [
              Form(
                key: _propertyFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  Row(children: [
                    Expanded(
                        child: FormInputWidget(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: state.matController,
                              selection: new TextSelection.collapsed(
                                  offset: state.matController.length))),
                      labelText: 'Matrícula inmobiliaria',
                      onChange: (value) => _propertyCubit.matChanged(value),
                      readOnly: !state.isEdit,
                    ))
                  ]),
                  Row(children: [
                    Expanded(
                        child: FormInputWidget(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: state.areaController,
                              selection: new TextSelection.collapsed(
                                  offset: state.areaController.length))),
                      labelText: 'Área',
                      onChange: (value) => _propertyCubit.areaChanged(value),
                      readOnly: !state.isEdit,
                    ))
                  ]),
                  Row(children: [
                    Expanded(
                        child: FormInputWidget(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: state.depController,
                              selection: new TextSelection.collapsed(
                                  offset: state.depController.length))),
                      labelText: 'Depósito',
                      onChange: (value) => _propertyCubit.DepChanged(value),
                      readOnly: !state.isEdit,
                    ))
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Text(
                          'Editar Parqueadero',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5F5E88)),
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return AlertDialog(
                                      //scrollable: true,
                                      title: Row(children: [
                                        Padding(
                                            padding: EdgeInsets.all(20.0),
                                            child: Text(
                                              'Parqueadero',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF5F5E88)),
                                            )),
                                        Spacer(),
                                        if (state.isEdit)
                                          RawMaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                _propertyCubit.aparcamentoForms
                                                    .insert(
                                                        0,
                                                        Parking(
                                                            name: '',
                                                            realEstateRegistration:
                                                                '',
                                                            id: ''));
                                                _scrollController.animateTo(
                                                    _scrollController.position
                                                        .minScrollExtent,
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    curve:
                                                        Curves.fastOutSlowIn);
                                              });
                                            },
                                            fillColor: Color(0xFF8C81FE),
                                            child: Icon(
                                              Icons.add,
                                              size: 22.0,
                                              color: Colors.white,
                                            ),
                                            shape: CircleBorder(),
                                          ),
                                      ]),
                                      actions: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xff6456EB)),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("Aceptar")),
                                      ],
                                      content: state.isEdit
                                          ? Scrollbar(
                                              controller: _scrollController,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  controller: _scrollController,
                                                  itemCount: _propertyCubit
                                                      .aparcamentoForms.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return AparcamentoFormItemWidget(
                                                        index: _propertyCubit
                                                            .aparcamentoForms
                                                            .length,
                                                        aparcamentoModel:
                                                            _propertyCubit
                                                                    .aparcamentoForms[
                                                                index],
                                                        key: UniqueKey(),
                                                        onRemove: () {
                                                          setState(() {
                                                            int item = _propertyCubit
                                                                .aparcamentoForms
                                                                .indexWhere((element) => (element
                                                                        .id ==
                                                                    _propertyCubit
                                                                        .aparcamentoForms[
                                                                            index]
                                                                        .id));
                                                            if (_propertyCubit
                                                                    .aparcamentoForms !=
                                                                null)
                                                              _propertyCubit
                                                                  .aparcamentoForms
                                                                  .removeAt(
                                                                      item);
                                                          });
                                                        });
                                                  }))
                                          : Scrollbar(
                                              controller: _scrollController,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  controller: _scrollController,
                                                  itemCount: _propertyCubit
                                                      .aparcamentoForms.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                        child: Card(
                                                            child: ListTile(
                                                      title: Text(
                                                          'Nº: ${_propertyCubit.aparcamentoForms[index].name}',
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xFF5F5E88))),
                                                      subtitle: Text(
                                                          'Matrícula inmobiliaria: ${_propertyCubit.aparcamentoForms[index].realEstateRegistration}'),
                                                      leading: Icon(
                                                          Icons.local_parking,
                                                          color: Color(
                                                              0xFF776BF8)),
                                                    )));
                                                  })));
                                });
                              });
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]),
              ),
              SizedBox(height: 10),
              if (state.isLoading)
                Padding(
                    padding: EdgeInsets.only(bottom: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Color(0xFF776BF8),
                            strokeWidth: 3,
                          ),
                        )),
                      ],
                    )),
              if (state.isEdit)
                Row(children: [
                  Expanded(
                      child: MaterialButton(
                    padding: EdgeInsets.all(20.0),
                    color: Color(0xFF776BF8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(
                        color: Color(0xff7E72FF),
                      ),
                    ),
                    elevation: 0,
                    onPressed: () {
                      _propertyCubit.isLoading(true);
                      String idApart =
                          BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.id.toString();
                      _propertyCubit.savePropertyUpdate(idApart, context);
                    },
                    child: Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )),
                ]),
            ])),
        if (!state.isLoading)
          Positioned(
              top: 10,
              right: 10,
              child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment(0, 1.0),
                      colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
                    ),
                  ),
                  child: IconButton(
                      icon: Image.asset('assets/icons/iconEdit.png'),
                      onPressed: () {
                        setState(() {
                          _propertyCubit.isEditChanged(!state.isEdit);
                        });
                      }))),
      ]);
    });
  }
}
