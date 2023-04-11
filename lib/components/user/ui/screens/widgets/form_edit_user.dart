import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:hipal/widgets/border_line.dart';
import 'package:hipal/widgets/input_decorations.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class FormEditUser extends StatefulWidget {
  final String? title;
  final String pageBack;
  final bool leadingBack;

  FormEditUser({
    Key? key,
    this.title,
    this.pageBack = '',
    this.leadingBack = true,
  }) : super(key: key);
  _FormEditUser createState() => _FormEditUser();
}

class _FormEditUser extends State<FormEditUser> {
  File? imageFile;
  final _formKey = GlobalKey<FormState>();
  File? image;
  final picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  final _dateController = TextEditingController();
  String genderType = "";
  List<String> netmorkSocial = ["Facebook", "Instagram", "Link"];
  Map newNetmorkSocial = new Map();
  late PhoneNumber phoneNumber;
  late TextEditingController _controllerPhone;
  @override
  void initState() {
    super.initState();
    final blocProvider = BlocProvider.of<UserBloc>(context);
    final phone = blocProvider.state.userForm?.user!.phone!.number != null
        ? blocProvider.state.userForm!.user!.phone!.number
            .toString()
            .replaceAll(' ', '')
        : '';
    final phoneCode =
        blocProvider.state.userForm?.user!.phone!.countryCode != null
            ? blocProvider.state.userForm?.user!.phone!.countryCode
            : '';
    phoneNumber = PhoneNumber(isoCode: phoneCode, phoneNumber: phone);

    _controllerPhone =
        new TextEditingController(text: phone.replaceAll('${phoneCode}', ''));
  }

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
    _controllerPhone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FAFE),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Editar cuenta',
          style: TextStyle(color: Color(0xFF343887)),
        ),
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: widget.leadingBack
            ? BackButton(
                color: Color(0xFF8075FB),
                onPressed: () {
                  BlocProvider.of<UserBloc>(context).add(ChangeUserEdit(false));
                  Navigator.pushReplacementNamed(context, widget.pageBack);
                },
              )
            : null,
      ),
      body: Container(
          child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          children: [
            _imageUser(),
            _personalInformation(),
            Container(
              margin: EdgeInsets.only(left: 30, right: 51),
              child: _formUSer(),
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 38, top: 53, right: 38, bottom: 50),
                child: _buttonSaveUser()),
          ],
        ),
      )),
    );
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
        BlocProvider.of<UserBloc>(context).add(ChangeImageUSer(photoBase64));
        BlocProvider.of<UserBloc>(context).add(ChangeUserNewPhoto(true));
      }
    });
  }

  Widget _imageUser() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String url = "";
      if (state.userInfo?.user?.photo != null) {
        url = state.userInfo!.user!.photo!.url.toString();
      }
      return Column(
        children: [
          state.newPhoto
              ? _imageNew()
              : Container(
                  width: 67.0,
                  height: 67.0,
                  decoration: new BoxDecoration(
                      color: const Color(0xff6456EB),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: url != ""
                            ? NetworkImage(url)
                            : AssetImage('assets/images/image-default.png')
                                as ImageProvider,
                      ))),
          TextButton(
              child: Text(
                "Agregar foto de perfil",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8075FB)),
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
              })
        ],
      );
    });
  }

  Widget _formUSer() {
    return Column(
      children: [
        Row(children: [Expanded(child: _fullnameField())]),
        Row(children: [
          Expanded(child: _idField()),
          Expanded(child: _genderTypeField())
        ]),
        Row(children: [Expanded(child: _emailField())]),
        Row(children: [
          Expanded(
            child: _phoneFields(),
          ),
        ]),
        SizedBox(
          height: 15,
        ),
        Row(children: [Expanded(child: _dateBirthField())]),
        Row(
          children: [Expanded(child: _cityCountryField())],
        )
      ],
    );
  }

  Widget _personalInformation() {
    return Container(
      margin: EdgeInsets.only(left: 28.0),
      child: ListTile(
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
            size: 22.0,
          ),
        ),
        title: const Text(
          'Información Personal',
          style: TextStyle(
              color: Color(0xff8378FC),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _fullnameField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          initialValue: state.userForm?.user!.firstname != null
              ? '${state.userForm!.user!.firstname.toString()} ${state.userForm!.user!.lastname.toString()}'
              : '',
          enabled: true,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nombre completo',
              borderColor: Color(0xFFDFDDFD),
              sizeLabel: 13),
          onChanged: (value) =>
              context.read<UserBloc>().add(ChangeFirstName(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      ));
    });
  }

  Widget _firstnameField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          initialValue: state.userForm?.user!.firstname != null
              ? state.userForm!.user!.firstname.toString()
              : '',
          enabled: true,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nombre',
              borderColor: Color(0xFFDFDDFD),
              sizeLabel: 13),
          onChanged: (value) =>
              context.read<UserBloc>().add(ChangeFirstName(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      ));
    });
  }

  Widget _lastNameField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          initialValue: state.userForm?.user!.lastname != null
              ? state.userForm!.user!.lastname.toString()
              : '',
          enabled: true,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Apellido',
              borderColor: Color(0xFFDFDDFD),
              sizeLabel: 13),
          onChanged: (value) =>
              context.read<UserBloc>().add(ChangeLastName(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      ));
    });
  }

  Widget _idField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 10, left: 20),
        height: 70,
        child: TextFormField(
          enableInteractiveSelection: false,
          enabled: true,
          initialValue: state.userForm?.user!.identity != null
              ? state.userForm!.user!.identity.toString()
              : '',
          autocorrect: false,
          keyboardType: TextInputType.number,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nº identificación',
              borderColor: Color(0xFFE0E5F1),
              sizeLabel: 13),
          onChanged: (value) =>
              context.read<UserBloc>().add(ChangeIdentityUser(value)),
          validator: (value) => (value == null ||
                  value == '' ||
                  value.contains(RegExp(r'[A-Z-a-z-*$,#+()./\?¡¿!"°| ]')))
              ? ''
              : null,
        ),
      );
    });
  }

  Widget _genderTypeField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String genderType = " ";
      if (state.userForm?.user?.gender != null) {
        if (state.userForm?.user?.gender == "Female" ||
            genderType == "Femenino") {
          genderType = "Femenino";
        } else if (state.userForm?.user?.gender == "Male" ||
            genderType == "Masculino") {
          genderType = "Masculino";
        } else {
          genderType = "No definido";
        }
      }
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 10, left: 20, top: 5, bottom: 0),
        child: PopupMenuButton(
            enabled: true,
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Género',
                              style: TextStyle(
                                  color: Color(0xff9FA7B8), fontSize: 10),
                            ),
                            Text(
                              genderType,
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
            onSelected: (newType) =>
                context.read<UserBloc>().add(ChangeGender(newType.toString())),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(child: Text("Masculino"), value: "Male"),
                  PopupMenuItem(child: Text("Femenino"), value: "Female"),
                  PopupMenuItem(child: Text("No definido"), value: "Undefined"),
                ]),
      ));
    });
  }

  Widget _emailField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 10, left: 20),
        height: 70,
        child: TextFormField(
          enabled: true,
          initialValue: state.userForm?.user!.email != null
              ? state.userForm!.user!.email.toString()
              : '',
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Email',
              borderColor: Color(0xFFE0E5F1),
              sizeLabel: 13),
          onChanged: (value) =>
              context.read<UserBloc>().add(ChangeEmailUser(value)),
          validator: (value) => (state.isValidEmail && value != "") ? null : '',
        ),
      );
    });
  }

  Widget _cityCountryField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String city = "";
      if (state.userInfo?.apartment?.tower?.residential?.city?.name != null) {
        city = state.userInfo!.apartment!.tower!.residential!.city!.name
                .toString() +
            " - Colombia";
      }
      return Container(
        margin: const EdgeInsets.only(right: 10, left: 20),
        height: 70,
        child: TextFormField(
          readOnly: true,
          initialValue: city,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Ciudad/País',
              borderColor: Color(0xFFE0E5F1),
              sizeLabel: 13),
          onChanged: (value) =>
              context.read<UserBloc>().add(ChangeCityUser(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _phoneFields() {
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 20),
        height: 80,
        child: InternationalPhoneNumberInput(
          errorMessage: 'Número incorrecto',
          onInputChanged: (PhoneNumber number) {
            context.read<UserBloc>().number =
                number.phoneNumber!.replaceAll('${number.dialCode}', '');
            context.read<UserBloc>().nationalNumber = number.phoneNumber!;
            context.read<UserBloc>().countryCode = number.isoCode!;
            context.read<UserBloc>().e164Number = number.dialCode!;
          },
          onInputValidated: (bool value) {},
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.DROPDOWN,
            setSelectorButtonAsPrefixIcon: true,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          selectorTextStyle: TextStyle(color: Color(0xff5C5D87)),
          initialValue: phoneNumber,
          textStyle: TextStyle(color: Color(0xff5C5D87)),
          textFieldController: _controllerPhone,
          formatInput: false,
          keyboardType:
              TextInputType.numberWithOptions(signed: true, decimal: true),
        ));
  }

  Widget _dateBirthField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      _dateController.text = state.userForm?.user?.birthDate != null
          ? DateFormat('yyyy-MM-dd').format(state.userForm!.user!.birthDate!)
          : '';
      return Container(
        margin: const EdgeInsets.only(right: 10, left: 20),
        height: 70,
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
            context.read<UserBloc>().add(ChangeDateUser(_dateController.text));
          },
        ),
      );
    });
  }

  Widget _imageNew() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
          width: 67,
          height: 67,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xff6456EB),
          ),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(48),
              child: Image.file(
                image!,
                width: 67,
                height: 67,
                fit: BoxFit.cover,
              ),
            ),
          ));
    });
  }

  _onSubmit(state) async {
    String valueRec = '';
    String name = '';
    String lastNamex = '';

    if (state.userForm!.user.firstname != null) {
      valueRec = state.userForm!.user!.firstname.toString();
    }

    if (state.userForm!.user.lastname != null) {
      lastNamex = state.userForm!.user!.lastname.toString();
    }

    if (valueRec.split(' ').length > 1) {
      name = valueRec.split(' ')[0];
      lastNamex = valueRec.split(' ')[1];
    } else {
      name = valueRec;
    }

    FocusScope.of(context).unfocus();
    final userService = BlocProvider.of<UserBloc>(context);
    userService.add(ChangePhoneUser());
    final Map<String, dynamic> objectPhone =
        json.decode(json.encode(state.userForm!.user!.phone!.toJson()));
    objectPhone['number'] = userService.number;
    objectPhone['countryCode'] = userService.countryCode;
    objectPhone['e164Number'] = userService.e164Number;
    objectPhone['internationalNumber'] = userService.internationalNumber;
    objectPhone['nationalNumber'] = userService.nationalNumber;
    if (!_formKey.currentState!.validate()) return;
    final params = {
      "firstname": state.userForm!.user.firstname != null ? name : '',
      "lastname": state.userForm!.user.lastname != null ? lastNamex : '',
      "identity": state.userForm!.user.identity != null
          ? state.userForm!.user.identity
              .toString()
              .replaceAll(RegExp(r"\s+"), "")
          : '',
      "email": state.userForm!.user.email != null
          ? state.userForm!.user.email.toString().replaceAll(RegExp(r"\s+"), "")
          : '',
      "gender": state.userForm!.user.gender != null
          ? state.userForm!.user.gender
          : '',
      "birthDate": state.userForm!.user.birthDate != null
          ? DateFormat('yyyy-MM-dd').format(state.userForm!.user.birthDate)
          : '',
      "photo": state.image != null
          ? 'data:image/jpeg;base64,' + state.image.toString()
          : '',
    };
    userService.add(ChangeLoading2(true));

    final dynamic response;
    response = await userService.userRepo.editUser(
        context,
        state.userInfo!.user.id,
        params,
        objectPhone,
        state.userForm!.user.phone!.id);

    userService.add(ChangeLoading2(false));
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      BlocProvider.of<UserBloc>(context).add(ChangeUserEdit(true));
      final loginService = BlocProvider.of<UserBloc>(context);
      final dynamic response = await loginService.userRepo.getUser(context);
      UserInfo? userInfo = UserInfo.fromJson(response);
      context.read<UserBloc>().add(ChangeUser(userInfo!));
      context.read<UserBloc>().add(ChangeFormUser(userInfo));
      BlocProvider.of<UserBloc>(context).add(ChangeLoading2(false));
      BlocProvider.of<UserBloc>(context).add(GetCurrentUser(context, true));
      Navigator.pushReplacementNamed(context, "user");
    }
  }

  Widget _buttonSaveUser() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
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
                    offset: const Offset(0, 5),
                  ),
                ],
              )),
          onPressed: () async {
            state.isLoading ? null : _onSubmit(state);
          });
    });
  }

  Widget _socialNetwork() {
    return Column(
      children: [
        _titleSocialMedia(),
        _instagram(),
        BorderLine(1, 0, 0, 0xFFDFDDFD),
        _facebook(),
        BorderLine(1, 0, 0, 0xFFDFDDFD),
        _youtube(),
        BorderLine(1, 0, 0, 0xFFDFDDFD),
      ],
    );
  }

  Widget _titleSocialMedia() {
    return Container(
      margin: EdgeInsets.only(left: 28.0),
      child: ListTile(
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
              0xe924,
              fontFamily: 'icomoon',
            ),
            color: Colors.white,
            size: 22.0,
          ),
        ),
        title: const Text(
          'Redes sociales',
          style: TextStyle(
              color: Color(0xff8378FC),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _instagram() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String social = "";
      if (state.userForm?.user?.socialNetworks != null) {
        if (state.userForm!.user!.socialNetworks!.length > 0) {
          for (var item in state.userForm!.user!.socialNetworks!) {
            if (item.split(" ")[0] == "Instagram") {
              social = item.split(" ")[1];
              newNetmorkSocial["Instagram"] = social;
            }
          }
        }
      }
      return Container(
        margin: EdgeInsets.only(left: 40.0, right: 10.0),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 10.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    const IconData(
                      0xe927,
                      fontFamily: 'icomoon',
                    ),
                    color: Color.fromRGBO(123, 111, 250, 1),
                    size: 17.0,
                  ),
                )),
            Flexible(
              flex: 2,
              child: const Text(
                'Instagram',
                style: TextStyle(
                    color: Color(0xff5C5D87),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                      initialValue: social,
                      enabled: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Color(0xff5C5D87),
                          fontWeight: FontWeight.bold),
                      decoration: InputDecorations.authInputDecoration(
                          hintText: '',
                          labelText: '',
                          borderColor: Color(0xFFDFDDFD),
                          sizeLabel: 13),
                      onChanged: (value) {
                        List<String> list = [];
                        if (value != "") {
                          newNetmorkSocial
                              .forEach((k, v) => list.add("${k} ${v}"));
                        } else {
                          newNetmorkSocial.remove("Instagram");
                          newNetmorkSocial
                              .forEach((k, v) => list.add("${k} ${v}"));
                        }
                        context.read<UserBloc>().add(ChangeSocialNetwork(list));
                      }),
                )),
          ],
        ),
      );
    });
  }

  Widget _facebook() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String social = "";
      if (state.userForm?.user?.socialNetworks != null) {
        if (state.userForm!.user!.socialNetworks!.length > 0) {
          for (var item in state.userForm!.user!.socialNetworks!) {
            if (item.split(" ")[0] == "Facebook") {
              social = item.split(" ")[1];
              newNetmorkSocial["Facebook"] = social;
            }
          }
        }
      }
      return Container(
        margin: EdgeInsets.only(left: 40.0, right: 10.0),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 10.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    const IconData(
                      0xe928,
                      fontFamily: 'icomoon',
                    ),
                    color: Color.fromRGBO(123, 111, 250, 1),
                    size: 17.0,
                  ),
                )),
            Flexible(
              flex: 2,
              child: const Text(
                'Facebook',
                style: TextStyle(
                    color: Color(0xff5C5D87),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                      initialValue: social,
                      enabled: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Color(0xff5C5D87),
                          fontWeight: FontWeight.bold),
                      decoration: InputDecorations.authInputDecoration(
                          hintText: '',
                          labelText: '',
                          borderColor: Color(0xFFDFDDFD),
                          sizeLabel: 13),
                      onChanged: (value) {
                        List<String> list = [];
                        if (value != "") {
                          newNetmorkSocial["Facebook"] = value;
                          newNetmorkSocial
                              .forEach((k, v) => list.add("${k} ${v}"));
                        } else {
                          newNetmorkSocial.remove("Facebook");
                          newNetmorkSocial
                              .forEach((k, v) => list.add("${k} ${v}"));
                        }
                        context.read<UserBloc>().add(ChangeSocialNetwork(list));
                      }),
                )),
          ],
        ),
      );
    });
  }

  Widget _youtube() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String social = "";
      if (state.userForm?.user?.socialNetworks != null) {
        if (state.userForm!.user!.socialNetworks!.length > 0) {
          for (var item in state.userForm!.user!.socialNetworks!) {
            if (item.split(" ")[0] == "Youtube") {
              social = item.split(" ")[1];
            }
          }
        }
      }
      return Container(
        margin: EdgeInsets.only(left: 40.0, right: 10.0),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: 24,
                  height: 24,
                  margin: EdgeInsets.only(right: 10.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    const IconData(
                      0xe929,
                      fontFamily: 'icomoon',
                    ),
                    color: Color.fromRGBO(123, 111, 250, 1),
                    size: 17.0,
                  ),
                )),
            Flexible(
              flex: 2,
              child: const Text(
                'Youtube',
                style: TextStyle(
                    color: Color(0xff5C5D87),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    initialValue: social,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
                    decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: '',
                        borderColor: Color(0xFFDFDDFD),
                        sizeLabel: 13),
                  ),
                )),
          ],
        ),
      );
    });
  }
}
