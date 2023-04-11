import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/myservices/bloc/service_bloc.dart';
import 'package:hipal/components/myservices/model/service.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:hipal/widgets/input_decorations.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'design_btn.dart';
import 'list_add_service.dart';

// ignore: must_be_immutable
class ListService extends StatefulWidget {
  Service service;

  ListService(this.service);

  createState() => _ListService();
}

class _ListService extends State<ListService> {
  bool _enableText = false;
  File? imageFile;
  final _formKey = GlobalKey<FormState>();
  File? image;
  final picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  final _typeController = TextEditingController();
  final _providerController = TextEditingController();
  final _contractController = TextEditingController();
  final _dateController = TextEditingController();
  String? photoBase64;

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _typeController.dispose();
    _providerController.dispose();
    _contractController.dispose();
    _dateController.dispose();
    int selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: Key(widget.service.id.toString()),
      initiallyExpanded: false,
      leading: (widget.service.image == null || widget.service.image == '')
          ? Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color(0xff6456EB),
                borderRadius: BorderRadius.all(Radius.circular(19.0)),
              ),
            )
          : Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: const Color(0xff6456EB),
                image: DecorationImage(
                  image: NetworkImage(widget.service.image!.url != null
                      ? widget.service.image!.url.toString()
                      : ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(19.0)),
              ),
            ),
      title: Text(
        widget.service.type != null ? widget.service.type.toString() : "",
        style: const TextStyle(
          color: Color(0xff9FA7B8),
          fontSize: 12,
        ),
      ),
      subtitle: TextField(
        enabled: _enableText,
        style: const TextStyle(
          color: Color(0xff343887),
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "No. ${widget.service.contract}",
          hintStyle: const TextStyle(
            color: Color(0xff343887),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      trailing: Visibility(
        visible: true,
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
          child: Image.asset('assets/images/iconEdit.png'),
        ),
      ),
      children: <Widget>[
        serviceForm(),
        Container(
            margin:
                const EdgeInsets.only(left: 38, top: 53, right: 38, bottom: 10),
            child: _buttonEditService()),
        Container(
          child: _buttonDelete(),
        )
      ],
    );
  }

  Widget serviceForm() {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Row(children: [Expanded(child: _type())]),
            Row(children: [Expanded(child: _provider())]),
            Row(children: [Expanded(child: _contract())]),
            const ListTile(
              title: Text(
                'Agregar fotografía del servicio',
                style: TextStyle(
                  color: Color(0xff8378FC),
                  fontSize: 13,
                ),
              ),
            ),
            Row(children: [
              if (image != null) ...[
                _imageNew(),
              ] else if (widget.service.image != null)
                _imageSaved(),
              _selectImage(),
            ]),
          ],
        ));
  }

  Widget _type() {
    _typeController.text = widget.service.type.toString();
    return Container(
        child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        controller: _typeController,
        enabled: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
        decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Tipo de servicio',
            borderColor: Color(0xFFDFDDFD),
            sizeLabel: 13),
        validator: (value) => (value == null || value == '') ? '' : null,
      ),
    ));
  }

  Widget _provider() {
    _providerController.text = widget.service.provider.toString();
    return Container(
        child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        controller: _providerController,
        enabled: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
        decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Proveedor de servicio',
            borderColor: Color(0xFFDFDDFD),
            sizeLabel: 13),
        validator: (value) => (value == null || value == '') ? '' : null,
      ),
    ));
  }

  Widget _contract() {
    _contractController.text = widget.service.contract.toString();
    return Container(
        child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: TextFormField(
        controller: _contractController,
        enabled: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
        decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Número de contrato',
            borderColor: Color(0xFFDFDDFD),
            sizeLabel: 13),
        validator: (value) => (value == null || value == '') ? '' : null,
      ),
    ));
  }

  _onSubmit(state) async {
    print("_onSubmit");
    FocusScope.of(context).unfocus();
    final providerService = BlocProvider.of<ServiceBloc>(context);
    String idServicio = widget.service.id.toString();
    // Validate Form
    if (!_formKey.currentState!.validate()) return;
    final params = {
      "type": _typeController.text,
      "provider": _providerController.text,
      "contract": _contractController.text,
      "image": photoBase64 != null
          ? 'data:image/jpeg;base64,' + photoBase64.toString()
          : '',
    };
    providerService.add(ChangeLoading(true));

    final dynamic response;
    response = await providerService.serviceRepo
        .editService(context, idServicio, params);
    print(response.statusCode);
    providerService.add(ChangeLoading(false));
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      print("====== Ok service create");
      Service newService =
          Service.fromJson(json.decode(response.body)) as Service;
      providerService.add(LoadNewService(newService));
      _typeController.text = "";
      _providerController.text = "";
      _contractController.text = "";
      Alert(
              context: context,
              content: confirmPopup(context),
              style: AlertStyle(isButtonVisible: false, isCloseButton: false))
          .show();
      print("====== ===================");
    }
  }

  Widget _buttonEditService() {
    return BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
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
              padding: EdgeInsets.symmetric(horizontal: 55, vertical: 18),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                state.isLoading
                    ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        'Guardar',
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

  Widget _buttonDelete() {
    return BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Center(
          child: MaterialButton(
            onPressed: () {
              _deleteService(context, widget.service.id.toString());
            },
            child: Text('Eliminar',
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

  void _deleteService(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Por favor confirme'),
            content: const Text('¿Desea eliminar el servicio?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    print("Si");
                    BlocProvider.of<ServiceBloc>(context)
                        .add(DeleteService(context, id));
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

  Widget _imageNew() {
    return BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
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
    return BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
      return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Image(
          image: NetworkImage(widget.service.image?.url != null
              ? widget.service.image!.url.toString()
              : ''),
          width: 84,
          height: 84,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  Widget _selectImage() {
    return BlocBuilder<ServiceBloc, ServiceState>(builder: (context, state) {
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
        photoBase64 = base64Encode(imageBytes);
      }
    });
  }

  confirmPopup(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45.0, bottom: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: SizedBox(
            height: 95.0,
            width: 117.0,
            child: ClipRRect(
                child: Image.asset(
              "assets/images/ok_check.png",
              isAntiAlias: true,
              fit: BoxFit.fill,
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 26.0),
            child: Text(
              "Servicio actualizado exitosamente",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0),
            )),
        GradientButton("Aceptar",
            () => {Navigator.of(context, rootNavigator: true).pop()}, null)
      ],
    );
  }
}
