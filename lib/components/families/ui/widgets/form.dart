import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/assembly/ui/widgets/power_assembly.dart';
import 'package:hipal/serializers/typefilter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:hipal/components/families/bloc/formfamily_bloc.dart';
import 'package:hipal/components/families/bloc/families_bloc.dart';
import 'package:hipal/components/families/model/family.dart';
import 'package:hipal/widgets/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class FamiliesForm extends StatefulWidget {
  @override
  _FamiliesForm createState() => _FamiliesForm();
}

class _FamiliesForm extends State<FamiliesForm> {
  final _formKey = GlobalKey<FormState>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  /// Variables
  File? imageFile;
  DateTime selectedDate = DateTime.now();
  final _dateController = TextEditingController();
  String genderType = "No definido";
  int color = 0xFFE0E5F1;
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
        BlocProvider.of<FormfamilyBloc>(context).add(ChangeImage(photoBase64));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FormfamilyBloc>(context).add(LoadTypes(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
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

                            Row(children: [Expanded(child: _nameField())]),

                            Row(
                              children: [
                                Expanded(
                                  child: _typeField(),
                                ),
                                Expanded(
                                  child: _identityField(),
                                )
                              ],
                            ),

                            _emailField(),

                            Row(
                              children: [
                                Expanded(
                                  child: _birtDateField(),
                                ),
                                Expanded(
                                  child: _genderField(),
                                )
                              ],
                            ),

                            _phoneField(),

                            const ListTile(
                              title: Text(
                                'Agregar fotografía del familiar',
                                style: TextStyle(
                                  color: Color(0xff8378FC),
                                  fontSize: 13,
                                ),
                              ),
                            ),

                            Row(children: [
                              if (image != null) ...[
                                _imageNew(),
                              ] else if (state.family != null &&
                                  state.family!.image != null)
                                _imageSaved(),
                              _selectImage(),
                            ]),
                            // BtnUpImage(AddFamily())

                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 38, top: 53, right: 38),
                          child: _buttonSaveFamily()),
                      Container(
                        margin: const EdgeInsets.only(top: 36),
                        child: _buttonCancel(),
                      )
                    ],
                  ))));
    });
  }

  Widget _iconTitle() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
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
          'Información de tu familiar',
          style: TextStyle(
              color: Color(0xff8378FC),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      );
    });
  }

  Widget _nameField() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
        builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          initialValue:
              state.family?.name != null ? state.family!.name.toString() : '',
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nombre',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon:
                  (state.family?.name != null && state.family!.name != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormfamilyBloc>().add(ChangeName(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      ));
    });
  }

  Widget _typeField() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
        builder: (context, state) {
      if (state.typeName != null) {
        color = 0xFFE0E5F1;
      }
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 10, left: 20, top: 5, bottom: 0),
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
                              state.nameType(state.typeName.toString()),
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
                      bottom: BorderSide(width: 1, color: Color(color)))),
            ),
            offset: Offset(0, 35),
            onSelected: (newType) => context
                .read<FormfamilyBloc>()
                .add(ChangeType(newType.toString())),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  ...state.typeFamilies!.map(
                    (item) => PopupMenuItem(
                        child:
                            Text(item.name != null ? item.name.toString() : ''),
                        value: item.id),
                  )
                ]),
      ));
    });
  }

  Widget _identityField() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 20, left: 10),
        height: 75,
        child: TextFormField(
          initialValue: state.family?.identity != null
              ? state.family!.identity.toString()
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
              suffixIcon: (state.family?.identity != null &&
                      state.family!.identity != '')
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
          onChanged: (value) =>
              context.read<FormfamilyBloc>().add(ChangeIdentity(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _emailField() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
        height: 75,
        child: TextFormField(
          initialValue:
              state.family?.email != null ? state.family!.email.toString() : '',
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Email',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon:
                  (state.family?.email != null && state.family!.email != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormfamilyBloc>().add(ChangeEmail(value)),
        ),
      );
    });
  }

  Widget _birtDateField() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
        builder: (context, state) {
      _dateController.text = state.family?.birthDate != null
          ? DateFormat('dd-MM-yyyy').format(state.family!.birthDate!)
          : '';
      return Container(
        margin: const EdgeInsets.only(right: 20, left: 20, top: 30),
        height: 75,
        padding: EdgeInsets.only(right: 0),
        child: TextFormField(
          readOnly: true,
          controller: _dateController,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              labelText: 'Fecha nacimiento',
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
            await showDatePicker(
              context: context,
              cancelText: '',
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.utc(
                  selectedDate.year, selectedDate.month, selectedDate.day),
            ).then((selectedDate) {
              if (selectedDate != null) {
                _dateController.text =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
              }
            });
            context
                .read<FormfamilyBloc>()
                .add(ChangeBirthDate(_dateController.text));
          },
        ),
      );
    });
  }

  Widget _genderField() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
      builder: (context, state) {
        if (state.family?.gender != null) {
          if (state.family?.gender == "Female" || genderType == "Femenino") {
            genderType = "Femenino";
          } else if (state.family?.gender == "Male" ||
              genderType == "Masculino") {
            genderType = "Masculino";
          } else if (state.family?.gender == "Undefined") {
            genderType = "No definido";
          }
        }
        return Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: DropdownButtonFormField(
              value: genderType,
              alignment: AlignmentDirectional.center,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff8C81FE), width: 2)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE0E5F1))),
                  labelText: 'Genero',
                  labelStyle: TextStyle(
                      color: Color(0xff9FA7B8),
                      fontSize: 14,
                      fontWeight: FontWeight.normal)),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Color(0xff8075FB),
              ),
              iconSize: 30,
              //underline: Container(),
              dropdownColor: Colors.white,
              items: ["Masculino", "Femenino", "No definido"]
                  .map((label) => DropdownMenuItem(
                        child: Text(
                          label.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xff343887),
                              fontWeight: FontWeight.bold),
                        ),
                        value: label,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  genderType = value.toString();
                });
                String gender = "";
                if (genderType == "Femenino") {
                  gender = "Female";
                } else if (genderType == "Masculino") {
                  gender = "Male";
                } else if (genderType == "No definido") {
                  gender = "Undefined";
                }
                context.read<FormfamilyBloc>().add(ChangeGender(gender));
              },
            ),
          ),
        );
      },
    );
  }

  getPhoneNumber(String phoneNumber) async {
    PhoneNumber numberNew =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'CO');
    return numberNew;
  }

  Widget _phoneField() {
    // state.family!.phone!=null
    PhoneNumber number = PhoneNumber(isoCode: 'CO');

    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        height: 75,
        padding: EdgeInsets.only(right: 0),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            if (number.phoneNumber != state.family!.phone)
              context
                  .read<FormfamilyBloc>()
                  .add(ChangePhone(number.phoneNumber.toString()));
          },
          onInputValidated: (bool value) {},
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: true,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          initialValue:
              (state.family?.phone != null && state.family!.phone!.length >= 9)
                  ? PhoneNumber(isoCode: 'CO', phoneNumber: state.family!.phone)
                  : number,
          textStyle: TextStyle(fontSize: 14),
          hintText: 'Número de celular',
          errorMessage: 'Número no válido',
          // textFieldController: controller,
          formatInput: false,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
          inputBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE0E5F1), width: 1),
          ),
          onSaved: (PhoneNumber number) {},
        ),
      );
    });
  }

  Widget _imageNew() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
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
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
        builder: (context, state) {
      return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Image(
          image: NetworkImage(state.family!.image!.url != null
              ? state.family!.image!.url.toString()
              : ''),
          width: 84,
          height: 84,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  Widget _selectImage() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
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

    final formFamilyService = BlocProvider.of<FormfamilyBloc>(context);
    final familyService = BlocProvider.of<FamiliesBloc>(context);
    final params = {
      "type": state.typeName,
      "name": state.family!.name != null ? state.family!.name : '',
      "email": state.family?.email != null ? state.family!.email : '',
      "phone": state.family?.phone != null ? state.family!.phone : '',
      "identity": state.family!.identity != null ? state.family!.identity : '',
    };
    if (state.family?.birthDate != null) {
      params["birthDate"] =
          DateFormat('yyyy-MM-dd').format(state.family!.birthDate);
    }
    if (state.image != '' && state.image != null) {
      params["image"] = 'data:image/jpeg;base64,' + state.image.toString();
    }
    if (state.family?.gender != null) {
      params["gender"] = state.family!.gender;
    }
    formFamilyService.add(ChangeLoading(true));

    final dynamic response;
    if (state.id == null || state.id == '') {
      response =
          await formFamilyService.familiesRepo.saveFamily(context, params);
    } else {
      response = await formFamilyService.familiesRepo
          .editFamily(context, state.id!, params);
    }

    formFamilyService.add(ChangeLoading(false));
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);

      if (state.id == null || state.id == '') {
        Family? newFamily = Family.fromJson(decodedResp) as Family;
        if (newFamily != null) familyService.add(LoadNewFamily(newFamily));
      } else {
        // Cambiar elemento del arreglo por la respuesta del servidor
        Family? editFamily = Family.fromJson(decodedResp) as Family;
        if (editFamily != null) familyService.add(LoadEditFamily(editFamily));
      }

      // Ir a la pantalla del Listado
      familyService.add(ChangeIndex(0));
      // Resetear Formulario
      formFamilyService.add(ResetForm(context));
    }
  }

  Widget _buttonSaveFamily() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
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
            print('este es el genero que llega a guarda');
            print(state.family?.gender);
            if (state.family?.name == null ||
                state.family?.name == '' ||
                state.typeName == null ||
                state.typeName == '' ||
                state.family?.identity == null ||
                state.family?.identity == '') {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Campos vacios',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: const <Widget>[
                          Text('Por favor llenar los campos obligatorios'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Aceptar',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff343887),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (state.typeName == null) {
                            setState(() {
                              color = 0xffFF0000;
                            });
                          }
                          if (!_formKey.currentState!.validate()) return;
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              state.isLoading ? null : _onSubmit(state);
            }
          });
    });
  }

  Widget _buttonCancel() {
    return BlocBuilder<FormfamilyBloc, FormfamilyState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Center(
          child: MaterialButton(
            onPressed: () {
              BlocProvider.of<FamiliesBloc>(context).add(ChangeIndex(0));
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
