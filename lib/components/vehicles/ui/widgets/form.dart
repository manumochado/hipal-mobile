import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hipal/components/vehicles/bloc/formvehicle_bloc.dart';
import 'package:hipal/components/vehicles/bloc/vehicles_bloc.dart';
import 'package:hipal/components/vehicles/model/vehicle.dart';
import 'package:hipal/widgets/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:image_cropper/image_cropper.dart';

class VehiclesForm extends StatefulWidget {
  @override
  _VehiclesForm createState() => _VehiclesForm();
}

class _VehiclesForm extends State<VehiclesForm> {
  final _formKey = GlobalKey<FormState>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  /// Variables
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
        BlocProvider.of<FormvehicleBloc>(context).add(ChangeImage(photoBase64));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FormvehicleBloc>(context).add(LoadTypes(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Scaffold(
          // controller: _refreshController,
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xffF9FAFE),
          body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 27, left: 38, right: 38),
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(31),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(119, 115, 158, 0.14),
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),

                            _iconTitle(),

                            Row(children: [
                              Expanded(child: _typeField()),
                              Expanded(child: _plateField())
                            ]),

                            Row(
                              children: [
                                Expanded(
                                  child: _colorField(),
                                ),
                                Expanded(
                                  child: _markField(),
                                )
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: _modelField(),
                                ),
                                Expanded(
                                  child: _yearField(),
                                )
                              ],
                            ),

                            const ListTile(
                              title: Text(
                                'Agregar fotografía del vehículo',
                                style: TextStyle(
                                  color: Color(0xff8378FC),
                                  fontSize: 13,
                                ),
                              ),
                            ),

                            Row(children: [
                              if (image != null) ...[
                                _imageNew(),
                              ] else if (state.vehicle != null &&
                                  state.vehicle!.image != null)
                                _imageSaved(),
                              _selectImage(),
                            ]),
                            // BtnUpImage(AddVehicle())

                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 38, top: 53, right: 38),
                          child: _buttonSaveVehicle()),
                      Container(
                        margin: const EdgeInsets.only(top: 36),
                        child: _buttonCancel(),
                      )
                    ],
                  ))));
    });
  }

  Widget _iconTitle() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return ListTile(
        leading: Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF8C81FE), Color(0xFF776BF8)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(123, 111, 250, 0.55),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            const IconData(
              0xe920,
              fontFamily: 'icomoon',
            ),
            color: Colors.white,
            size: 30.0,
          ),
        ),
        title: const Text(
          'Información de tu vehículo',
          style: TextStyle(
              color: Color(0xff8378FC),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      );
    });
  }

  Widget _typeField() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 0),
        child: PopupMenuButton(
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tipo',
                              style: TextStyle(color: Color(0xff9FA7B8)),
                            ),
                            Text(
                              state.nameType(state.typeName.toString()) != ""
                                  ? state.nameType(state.typeName.toString())
                                  : (state.typeVehicles != null &&
                                          state.typeVehicles!.length > 0)
                                      ? state.typeVehicles![0].name.toString()
                                      : "",
                              style: TextStyle(
                                  color: Color(0xff5C5D87),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                    Icon(const IconData(0xe921, fontFamily: 'icomoon'),
                        color: Color(0xff7E72FF))
                  ]),
              height: 45,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFE0E5F1)))),
            ),
            offset: Offset(0, 35),
            onSelected: (newType) => context
                .read<FormvehicleBloc>()
                .add(ChangeType(newType.toString())),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  ...state.typeVehicles!.map(
                    (item) => PopupMenuItem(
                        child:
                            Text(item.name != null ? item.name.toString() : ''),
                        value: item.id),
                  )
                ]),
      ));
    });
  }

  Widget _plateField() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 20),
        height: 75,
        child: TextFormField(
          initialValue: state.vehicle?.plate != null
              ? state.vehicle!.plate.toString()
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
              suffixIcon:
                  (state.vehicle?.plate != null && state.vehicle?.plate != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormvehicleBloc>().add(ChangePlate(value)),
          // validator: (value) => state.isValidEmail ? null : '',
        ),
      );
    });
  }

  Widget _colorField() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: TextFormField(
          initialValue: state.vehicle?.color != null
              ? state.vehicle!.color.toString()
              : '',
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Color',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon:
                  (state.vehicle?.color != null && state.vehicle!.color != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormvehicleBloc>().add(ChangeColor(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      ));
    });
  }

  Widget _markField() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 20),
        child: TextFormField(
          initialValue:
              state.vehicle?.mark != null ? state.vehicle!.mark.toString() : '',
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
                  (state.vehicle?.mark != null && state.vehicle?.mark != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormvehicleBloc>().add(ChangeMark(value)),
          // validator: (value) => state.isValidEmail ? null : '',
        ),
      );
    });
  }

  Widget _modelField() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 10, top: 0),
        child: TextFormField(
          initialValue: state.vehicle?.model != null
              ? state.vehicle!.model.toString()
              : '',
          autocorrect: false,
          keyboardType: TextInputType.text,
          style: TextStyle(
              color: Color.fromARGB(255, 69, 69, 71),
              fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Modelo',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon:
                  (state.vehicle?.model != null && state.vehicle?.model != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormvehicleBloc>().add(ChangeModel(value)),
        ),
      );
    });
  }

  Widget _yearField() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 20),
        child: TextFormField(
          initialValue:
              state.vehicle?.year != null ? state.vehicle!.year.toString() : '',
          autocorrect: false,
          keyboardType: TextInputType.numberWithOptions(),
          style: TextStyle(
            color: Color(0xff5C5D87),
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Año',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon:
                  (state.vehicle?.year != null && state.vehicle?.year != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormvehicleBloc>().add(ChangeYear(int.parse(value))),
          // validator: (value) => state.isValidEmail ? null : '',
        ),
      );
    });
  }

  Widget _imageNew() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Image.file(
          image!,
          width: 84,
          height: 84,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  Widget _imageSaved() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Image(
          image: NetworkImage(state.vehicle!.image!.url != null
              ? state.vehicle!.image!.url.toString()
              : ''),
          width: 84,
          height: 84,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  Widget _selectImage() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
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
                      style: TextStyle(color: Color(0xff8378FC), fontSize: 8),
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
                          print('pressed');
                          selectedImage(1);
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: Text('Seleccionar de la galería',
                            style: TextStyle(
                                color: Color(0xff8378FC), fontSize: 15)),
                        onPressed: () {
                          print('pressed');
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

  _onSubmit(state) async {
    FocusScope.of(context).unfocus();
    // Validate Form
    if (!_formKey.currentState!.validate()) return;

    final formVehicleService = BlocProvider.of<FormvehicleBloc>(context);
    final vehicleService = BlocProvider.of<VehiclesBloc>(context);
    final params = {
      "type": state.typeName.toString() != ""
          ? state.typeName.toString()
          : (state.typeVehicles != null && state.typeVehicles!.length > 0)
              ? state.typeVehicles![0].id.toString()
              : "",
      "color": state.vehicle!.color != null ? state.vehicle!.color : '',
      "model": state.vehicle!.model != null ? state.vehicle!.model : '',
      "year": state.vehicle!.year != null ? state.vehicle!.year.toString() : '',
      "plate": state.vehicle!.plate != null ? state.vehicle!.plate : '',
      "mark": state.vehicle!.mark != null ? state.vehicle!.mark : '',
      "image": state.image != ''
          ? 'data:image/jpeg;base64,' + state.image.toString()
          : '',
    };
    formVehicleService.add(ChangeLoading(true));

    final dynamic response;
    if (state.id == null || state.id == '') {
      response =
          await formVehicleService.vehiclesRepo.saveVehicle(context, params);
    } else {
      response = await formVehicleService.vehiclesRepo
          .editVehicle(context, state.id!, params);
    }

    formVehicleService.add(ChangeLoading(false));
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);

      if (state.id == null || state.id == '') {
        Vehicle? newVehicle = Vehicle.fromJson(decodedResp) as Vehicle;
        if (newVehicle != null) vehicleService.add(LoadNewVehicle(newVehicle));
      } else {
        // Cambiar elemento del arreglo por la respuesta del servidor
        print('LoadEditVehicle');
        Vehicle? editVehicle = Vehicle.fromJson(decodedResp) as Vehicle;
        if (editVehicle != null)
          vehicleService.add(LoadEditVehicle(editVehicle));
      }

      // Ir a la pantalla del Listado
      vehicleService.add(ChangeIndex(0));
      // Resetear Formulario
      formVehicleService.add(ResetForm(context));
    }
  }

  Widget _buttonSaveVehicle() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
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
          onPressed: () async {
            state.isLoading ? null : _onSubmit(state);
          });
    });
  }

  Widget _buttonCancel() {
    return BlocBuilder<FormvehicleBloc, FormvehicleState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Center(
          child: MaterialButton(
            onPressed: () {
              BlocProvider.of<FormvehicleBloc>(context).add(ResetForm(context));
              BlocProvider.of<VehiclesBloc>(context).add(ChangeIndex(0));
            },
            child: Text('Cancelar',
                style: const TextStyle(
                  color: Color(0xff8378FC),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      );
    });
  }

  /// Crop Image
  static Future<File?> cropImage(dynamic file) async {
    final File? croppedImage = await ImageCropper().cropImage(
        sourcePath: file.path,
        maxWidth: 500,
        maxHeight: 500,
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
