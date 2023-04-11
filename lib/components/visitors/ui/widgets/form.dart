import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/components/visitors/bloc/formvisit_bloc.dart';
import 'package:hipal/components/visitors/bloc/visitors_bloc.dart';
import 'package:hipal/components/visitors/model/visit.dart';
import 'package:hipal/widgets/input_decorations.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class VisitorsForm extends StatefulWidget {
  VisitorsForm({Key? key}) : super(key: key);

  @override
  State<VisitorsForm> createState() => _VisitorsFormState();
}

class _VisitorsFormState extends State<VisitorsForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _dateController;
  late TextEditingController _hourController;

  List<String> itemsTypeArrival = <String>[
    "Carro",
    "Moto",
    "Cicla",
    "Caminando"
  ];
  List<String> itemsTypeVisit = <String>[
    "Familiar",
    "Personal",
    "Medica",
    "Amistad",
    "Proveedor De Servicios",
    "Work"
  ];
  DateTime selectedDate = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  File? imageFile;

  File? image;
  final picker = ImagePicker();

  Future selectedImage(option) async {
    var pickedFile;
    if (option == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    File? imageCrop = await cropImage(pickedFile);
    setState(() {
      if (imageCrop != null) {
        image = File(imageCrop.path);
        List<int> imageBytes = imageCrop.readAsBytesSync();
        String photoBase64 = base64Encode(imageBytes);
        BlocProvider.of<FormvisitBloc>(context).add(ChangeImage(photoBase64));
      }
    });
  }

  @override
  void initState() {
    _dateController = TextEditingController();
    _hourController = TextEditingController();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final currentDate = context.read<FormvisitBloc>().state.visit?.date;
      final currentHour = context.read<FormvisitBloc>().state.visit?.hour;

      _dateController.text = currentDate != null
          ? DateFormat('dd-MM-yyyy').format(currentDate)
          : '';

      _hourController.text = currentHour != null ? currentHour : '';
    });
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _hourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffF9FAFE),
          body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _informationVisit(),
                    _nameVisitFile(),
                    _identityField(),
                    Row(children: [
                      Expanded(child: _dateIngressField()),
                      Expanded(child: _hourIngressField())
                    ]),
                    _typeVisitField(),
                    Row(children: [
                      Expanded(child: _typeArrivalField()),
                      Expanded(child: _numberCompanionFile())
                    ]),
                    _informationDriverFile(),
                    _informationVehicleFile(),
                    _markField(),
                    Row(children: [
                      Expanded(child: _plateField()),
                      Expanded(child: _colorField())
                    ]),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 38, top: 50, right: 38, bottom: 66),
                        child: _buttonSaveVisitors()),
                  ],
                )),
          ),
        );
      },
    );
  }

  Widget _informationVisit() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 83,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(123, 111, 250, 0.34),
                    blurRadius: 9,
                    offset: Offset(0, 5)),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/iconVisitantes.png'),
              const SizedBox(
                  width: 79,
                  height: 32,
                  child: Text(
                    'Información de tu visita',
                    style: TextStyle(color: Colors.white),
                  )),
              Image.asset('assets/images/points.png'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Torre: ', style: TextStyle(color: Colors.white)),
                  Text('Nº apartamento: ',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      context
                          .read<UserBloc>()
                          .state
                          .userInfo!
                          .apartment!
                          .tower!
                          .name
                          .toString(),
                      style: TextStyle(color: Colors.white)),
                  Text(
                      context
                          .read<UserBloc>()
                          .state
                          .userInfo!
                          .apartment!
                          .name
                          .toString(),
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _nameVisitFile() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
          height: 75,
          child: TextFormField(
            initialValue: state.visit?.fullName != null
                ? state.visit!.fullName.toString()
                : '',
            autocorrect: false,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Color(0xff5C5D87),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Dale un nombre a tu visita',
                borderColor: Color(0xFFE0E5F1),
                suffixIcon: (state.visit?.fullName != null &&
                        state.visit!.fullName != '')
                    ? Icon(
                        const IconData(0xe91e, fontFamily: 'icomoon'),
                        color: Color(0xff4DA979),
                      )
                    : null),
            onChanged: (value) =>
                context.read<FormvisitBloc>().add(ChangeFullName(value)),
            validator: (value) => (value == null || value == '') ? '' : null,
          ),
        );
      },
    );
  }

  Widget _identityField() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 30, left: 30, top: 30),
        height: 75,
        child: TextFormField(
          initialValue: state.visit?.identity != null
              ? state.visit!.identity.toString()
              : '',
          autocorrect: false,
          keyboardType: TextInputType.numberWithOptions(),
          style: TextStyle(
            color: Color(0xff5C5D87),
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Identificación',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon:
                  (state.visit?.identity != null && state.visit!.identity != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormvisitBloc>().add(ChangeIdentity(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _dateIngressField() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 20, left: 30, top: 30),
        height: 75,
        padding: EdgeInsets.only(right: 0),
        child: TextFormField(
          readOnly: true,
          controller: _dateController,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              labelText: 'Fecha ingreso',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffE0E5F1), width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff8176FB), width: 2)),
              labelStyle: TextStyle(
                  color: Color(0xff9FA7B8),
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          onTap: () async {
            final lastDate = DateTime.now();
            final selectedDate = await showDatePicker(
              context: context,
              cancelText: '',
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate:
                  DateTime.utc(lastDate.year + 1, lastDate.month, lastDate.day),
            );
            if (selectedDate != null) {
              _dateController.text =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
              context
                  .read<FormvisitBloc>()
                  .add(ChangeDate(_dateController.text));
            }
          },
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _hourIngressField() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(right: 30, left: 30, top: 30),
          height: 75,
          padding: EdgeInsets.only(right: 0),
          child: TextFormField(
            readOnly: true,
            controller: _hourController,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: 'Hora ingreso',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE0E5F1), width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff8176FB), width: 2)),
                labelStyle: TextStyle(
                    color: Color(0xff9FA7B8),
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
            onTap: () async {
              TimeOfDay? selectedTime = await showTimePicker(
                context: context,
                initialTime: time,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child ?? Container(),
                  );
                },
              );

              if (selectedTime != null) {
                String? hour = selectedTime.hour.toString();
                String? minute = selectedTime.minute.toString();
                int valDInt = int.parse(hour);
                if (valDInt >= 12) {
                  _hourController.text = '$hour:$minute p.m';
                } else {
                  _hourController.text = '$hour:$minute a.m';
                }

                context
                    .read<FormvisitBloc>()
                    .add(ChangeHour(_hourController.text));
              }
            },
            validator: (value) => (value == null || value == '') ? '' : null,
          ),
        );
      },
    );
  }

  Widget _typeVisitField() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
      builder: (context, state) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: DropdownButtonFormField(
              value: state.visit?.typeVisit != null
                  ? state.visit!.typeVisit.toString()
                  : 'Familiar',
              alignment: AlignmentDirectional.topStart,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff8C81FE), width: 2)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE0E5F1))),
                  labelText: 'Tipo de vista',
                  labelStyle: TextStyle(
                      color: Color(0xff9FA7B8),
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Color(0xff8075FB),
              ),
              iconSize: 30,
              dropdownColor: Colors.white,
              items: itemsTypeVisit
                  .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xff343887),
                            fontWeight: FontWeight.bold),
                      )))
                  .toList(),
              onChanged: (item) {
                setState(() => item as String?);

                context
                    .read<FormvisitBloc>()
                    .add(ChangeTypeVisit(item.toString()));
              },
            ),
          ),
        );
      },
    );
  }

  Widget _typeArrivalField() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: DropdownButtonFormField(
            value: state.visit?.typeArrival != null
                ? state.visit!.typeArrival.toString()
                : 'Carro',
            alignment: AlignmentDirectional.topStart,
            decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff8C81FE), width: 2)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE0E5F1))),
                labelText: 'Tipo de llegada',
                labelStyle: TextStyle(
                    color: Color(0xff9FA7B8),
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Color(0xff8075FB),
            ),
            iconSize: 30,
            dropdownColor: Colors.white,
            items: itemsTypeArrival
                .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xff343887),
                          fontWeight: FontWeight.bold),
                    )))
                .toList(),
            onChanged: (item) {
              setState(() => item as String?);
              context
                  .read<FormvisitBloc>()
                  .add(ChangeTypeArrival(item.toString()));
            },
          ),
        );
      },
    );
  }

  Widget _numberCompanionFile() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 30, top: 20),
        height: 75,
        child: TextFormField(
          initialValue: state.visit?.NumberPeople != null
              ? state.visit!.NumberPeople.toString()
              : '',
          autocorrect: false,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Color(0xff5C5D87),
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nº acompañantes',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: (state.visit?.NumberPeople != null &&
                      state.visit!.NumberPeople != '')
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
          onChanged: (value) => context
              .read<FormvisitBloc>()
              .add(ChangeNumberPeople(int.parse(value))),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _imageNew() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(left: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(59),
        ),
        child: Image.file(
          image!,
          width: 55,
          height: 55,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  Widget _imageSaved() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Image(
          image: NetworkImage(state.visit?.image!.url != null
              ? state.visit!.image!.url.toString()
              : ''),
          width: 55,
          height: 55,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  Widget _informationDriverFile() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
      builder: (context, state) {
        if (state.visit?.typeArrival != "Caminando") {
          return Container(
            margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
            height: 236,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(123, 111, 250, 0.34),
                      blurRadius: 9,
                      offset: Offset(0, 5)),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 10),
                    child: const Text(
                      'Información del conductor',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                ListTile(
                    leading: (image != null)
                        ? _imageNew()
                        : Container(
                            width: 55.0,
                            height: 55.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: state.visit?.image != null
                                      ? NetworkImage(
                                          state.visit!.image!.url.toString())
                                      : image == null
                                          ? AssetImage(
                                              'assets/images/image-default.png')
                                          : Image.file(image!,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover)
                                              as ImageProvider,
                                ))),
                    title: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        initialValue: state.visit?.driverName != null
                            ? state.visit!.driverName.toString()
                            : '',
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecorations.authInputDecoration(
                            hintText: '',
                            labelText: 'Nombre y apellidos',
                            borderColor: Color(0xFFE0E5F1),
                            suffixIcon: (state.visit?.driverName != null &&
                                    state.visit!.driverName != '')
                                ? Icon(
                                    const IconData(0xe91e,
                                        fontFamily: 'icomoon'),
                                    color: Color(0xff4DA979),
                                  )
                                : null),
                        onChanged: (value) => context
                            .read<FormvisitBloc>()
                            .add(ChangeDriverName(value)),
                        // validator: (value) => state.isValidEmail ? null : '',
                      ),
                    ),
                    subtitle: Row(children: [
                      if (state.visit != null && state.visit!.image != null)
                        _imageSaved(),
                      _selectImage(),
                    ])),
              ],
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
            height: 236,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(123, 111, 250, 0.34),
                      blurRadius: 9,
                      offset: Offset(0, 5)),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 10),
                    child: const Text(
                      'Información del visitante',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                ListTile(
                  leading: (image != null)
                      ? _imageNew()
                      : Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: state.visit?.image != null
                                    ? NetworkImage(
                                        state.visit!.image!.url.toString())
                                    : image == null
                                        ? AssetImage(
                                            'assets/images/image-default.png')
                                        : Image.file(image!,
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover) as ImageProvider,
                              ))),
                  title: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      initialValue: state.visit!.driverName != null
                          ? state.visit!.driverName.toString()
                          : '',
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecorations.authInputDecoration(
                          hintText: '',
                          labelText: 'Nombre y apellidos',
                          borderColor: Color(0xFFE0E5F1),
                          suffixIcon: (state.visit!.driverName != null &&
                                  state.visit!.driverName != '')
                              ? Icon(
                                  const IconData(0xe91e, fontFamily: 'icomoon'),
                                  color: Color(0xff4DA979),
                                )
                              : null),
                      onChanged: (value) => context
                          .read<FormvisitBloc>()
                          .add(ChangeDriverName(value)),
                    ),
                  ),
                  subtitle: Row(children: [
                    if (state.visit != null && state.visit!.image != null)
                      _imageSaved(),
                    _selectImage(),
                  ]),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _informationVehicleFile() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return state.visit?.typeArrival != "Caminando"
          ? Container(
              margin: EdgeInsets.only(top: 40, left: 30),
              child: Text(
                'Información del vehículo',
                style: TextStyle(
                    color: Color(0xff8378FC),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            )
          : Container();
    });
  }

  Widget _plateField() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return state.visit?.typeArrival != "Caminando"
          ? Container(
              margin: const EdgeInsets.only(left: 30, right: 10, top: 10),
              child: TextFormField(
                initialValue: state.visit?.licensePlate != null
                    ? state.visit!.licensePlate.toString()
                    : '',
                autocorrect: false,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Color(0xff5C5D87),
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Placa',
                    borderColor: Color(0xFFE0E5F1),
                    suffixIcon: (state.visit?.licensePlate != null &&
                            state.visit!.licensePlate != '')
                        ? Icon(
                            const IconData(0xe91e, fontFamily: 'icomoon'),
                            color: Color(0xff4DA979),
                          )
                        : null),
                onChanged: (value) =>
                    context.read<FormvisitBloc>().add(ChangePlate(value)),
              ),
            )
          : Container();
    });
  }

  Widget _colorField() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return state.visit?.typeArrival != "Caminando"
          ? Container(
              child: Padding(
              padding: EdgeInsets.only(left: 10, right: 30, top: 10),
              child: TextFormField(
                initialValue: state.visit?.color != null
                    ? state.visit!.color.toString()
                    : '',
                autocorrect: false,
                keyboardType: TextInputType.text,
                style: TextStyle(
                    color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
                decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Color',
                    borderColor: Color(0xFFE0E5F1),
                    suffixIcon:
                        (state.visit?.color != null && state.visit!.color != '')
                            ? Icon(
                                const IconData(0xe91e, fontFamily: 'icomoon'),
                                color: Color(0xff4DA979),
                              )
                            : null),
                onChanged: (value) =>
                    context.read<FormvisitBloc>().add(ChangeColor(value)),
              ),
            ))
          : Container();
    });
  }

  Widget _markField() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return state.visit?.typeArrival != "Caminando"
          ? Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                initialValue: state.visit?.mark != null
                    ? state.visit!.mark.toString()
                    : '',
                autocorrect: false,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Color(0xff5C5D87),
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Marca',
                    borderColor: Color(0xFFE0E5F1),
                    suffixIcon:
                        (state.visit?.mark != null && state.visit!.mark != '')
                            ? Icon(
                                const IconData(0xe91e, fontFamily: 'icomoon'),
                                color: Color(0xff4DA979),
                              )
                            : null),
                onChanged: (value) =>
                    context.read<FormvisitBloc>().add(ChangeMark(value)),
              ),
            )
          : Container();
    });
  }

  Widget _selectImage() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(left: 20),
        child: DottedBorder(
            color: const Color(0xff8075FB),
            borderType: BorderType.RRect,
            strokeWidth: 2,
            dashPattern: [4, 4],
            radius: Radius.circular(19.0),
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              child: Container(
                height: 84,
                width: 84,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment(0, 1.5),
                            colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
                          ),
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(const IconData(0xe91f, fontFamily: 'icomoon'),
                          color: Colors.white),
                    ),
                    const Text(
                      'Remplazar imagen',
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 8),
                    )
                  ],
                ),
              ),
              onPressed: () {
                final act = CupertinoActionSheet(
                    title: Text('Seleccione una opción'),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: Text('Tomar una foto',
                            style: TextStyle(
                                color: Color(0xff8378FC), fontSize: 15)),
                        onPressed: () {
                          selectedImage(1);
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: Text('Seleccionar de la galería',
                            style: TextStyle(
                                color: Color(0xff8378FC), fontSize: 15)),
                        onPressed: () {
                          selectedImage(2);
                          Navigator.pop(context);
                        },
                      )
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text('Cancelar',
                          style: TextStyle(
                              color: Color(0xffE43C45), fontSize: 17)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ));
                showCupertinoModalPopup(
                    context: context, builder: (BuildContext context) => act);
              },
            )),
      );
    });
  }

  Widget _buttonSaveVisitors() {
    return BlocBuilder<FormvisitBloc, FormvisitState>(
        builder: (context, state) {
      return MaterialButton(
          color: Color(0xFF776BF8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: Color(0xff7E72FF),
            ),
          ),
          elevation: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (state.isLoading)
                  Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(2.0),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,
                    ),
                  ),
                SizedBox(width: 5.0),
                Text(
                  state.id != null ? 'Guardar' : 'Agregar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ]),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff7B6FFA).withOpacity(0.34),
                    spreadRadius: 0,
                    blurRadius: 9,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              )),
          onPressed: () {
            state.isLoading ? null : _onSubmit(state);
          });
    });
  }

  _onSubmit(state) async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    final formVisitorsService = BlocProvider.of<FormvisitBloc>(context);
    final visitService = BlocProvider.of<VisitorsBloc>(context);
    final params = {
      "fullName":
          state.visit!.fullName != null ? state.visit!.fullName.toString() : '',
      "identity": state.visit!.identity != null ? state.visit!.identity : '',
      "date": state.visit!.date != null
          ? DateFormat('yyyy-MM-dd').format(state.visit!.date)
          : '',
      "hour": state.visit!.hour != null ? state.visit!.hour.toString() : '',
      "typeArrival": state.visit!.typeArrival != null
          ? state.visit!.typeArrival.toString()
          : 'Carro',
      "typeVisit": state.visit!.typeVisit != null
          ? state.visit!.typeVisit.toString()
          : 'Familiar',
      "state": "Activo",
      "NumberPeople": state.visit!.NumberPeople != null
          ? state.visit!.NumberPeople.toString()
          : '',
      "driverName": state.visit!.driverName != null
          ? state.visit!.driverName.toString()
          : '',
      "mark": state.visit!.mark != null ? state.visit!.mark.toString() : '',
      "licensePlate": state.visit!.licensePlate != null
          ? state.visit!.licensePlate.toString()
          : '',
      "color": state.visit!.color != null ? state.visit!.color.toString() : '',
      "image": state.image != ''
          ? 'data:image/jpeg;base64,' + state.image.toString()
          : '',
    };
    formVisitorsService.add(ChangeLoading(true));
    final dynamic response;
    if (state.id == null || state.id == '') {
      response =
          await formVisitorsService.visitorsRepo.saveVisitors(context, params);
    } else {
      response = await formVisitorsService.visitorsRepo
          .editVisitors(context, state.id!, params);
    }

    formVisitorsService.add(ChangeLoading(false));
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);
      if (state.id == null || state.id == '') {
        Visit? newVisitor = Visit.fromJson(decodedResp) as Visit;
        if (newVisitor != null) visitService.add(LoadNewVisitors(newVisitor));
      } else {
        Visit? editVisitor = Visit.fromJson(decodedResp) as Visit;
        if (editVisitor != null) visitService.add(LoadEditVisit(editVisitor));
      }

      visitService.add(ChangeIndex(0));

      formVisitorsService.add(ResetForm(context));
    }
  }

  /// Crop Image
  static Future<File?> cropImage(dynamic file) async {
    final File? croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        maxWidth: 150,
        maxHeight: 150,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Recortar',
            toolbarColor: Color(0xff8378FC),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    return croppedImage;
  }
}
