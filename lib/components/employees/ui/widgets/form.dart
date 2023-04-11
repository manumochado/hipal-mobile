import 'dart:convert';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hipal/components/employees/bloc/formemployee_bloc.dart';
import 'package:hipal/components/employees/bloc/employees_bloc.dart';
import 'package:hipal/components/employees/model/employee.dart';
import 'package:hipal/widgets/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EmployeesForm extends StatefulWidget {
  @override
  _EmployeesForm createState() => _EmployeesForm();
}

class _EmployeesForm extends State<EmployeesForm> {
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

    if (pickedFile != null) {
      File? imageCrop = await cropImage(pickedFile);
      setState(() {
        if (imageCrop != null) {
          image = File(imageCrop.path);
          List<int> imageBytes = imageCrop.readAsBytesSync();
          String photoBase64 = base64Encode(imageBytes);
          BlocProvider.of<FormemployeeBloc>(context)
              .add(ChangeImage(photoBase64));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
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

                            _identityField(),

                            _phoneField(),

                            const ListTile(
                              title: Text(
                                'Agregar fotografía del empleado',
                                style: TextStyle(
                                  color: Color(0xff8378FC),
                                  fontSize: 13,
                                ),
                              ),
                            ),

                            Row(children: [
                              if (image != null) ...[
                                _imageNew(),
                              ] else if (state.employee != null &&
                                  state.employee!.image != null)
                                _imageSaved(),
                              _selectImage(),
                            ]),
                            // BtnUpImage(AddEmployee())

                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                              left: 38, top: 53, right: 38),
                          child: _buttonSaveEmployee()),
                      Container(
                        margin: const EdgeInsets.only(top: 36),
                        child: _buttonCancel(),
                      )
                    ],
                  ))));
    });
  }

  Widget _iconTitle() {
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
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
          'Información del empleado',
          style: TextStyle(
              color: Color(0xff8378FC),
              fontSize: 13,
              fontWeight: FontWeight.w600),
        ),
      );
    });
  }

  Widget _nameField() {
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
        builder: (context, state) {
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          initialValue: state.employee?.name != null
              ? state.employee?.name.toString()
              : '',
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nombre',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon:
                  (state.employee?.name != null && state.employee?.name != '')
                      ? Icon(
                          const IconData(0xe91e, fontFamily: 'icomoon'),
                          color: Color(0xff4DA979),
                        )
                      : null),
          onChanged: (value) =>
              context.read<FormemployeeBloc>().add(ChangeName(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      ));
    });
  }

  Widget _identityField() {
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        height: 75,
        child: TextFormField(
          initialValue: state.employee?.identity != null
              ? state.employee!.identity.toString()
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
              suffixIcon: (state.employee?.identity != null &&
                      state.employee?.identity != '')
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
          onChanged: (value) =>
              context.read<FormemployeeBloc>().add(ChangeIdentity(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _phoneField() {
    // state.family!.phone!=null
    PhoneNumber number = PhoneNumber(isoCode: 'CO');

    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
        builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        height: 75,
        padding: EdgeInsets.only(right: 0),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            if (number.phoneNumber != state.employee!.phone)
              context
                  .read<FormemployeeBloc>()
                  .add(ChangePhone(number.phoneNumber.toString()));
          },
          onInputValidated: (bool value) {
            print('valid');
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: true,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          initialValue: (state.employee?.phone != null &&
                  state.employee!.phone!.length >= 9)
              ? PhoneNumber(isoCode: 'CO', phoneNumber: state.employee!.phone)
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
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
          },
        ),
      );
    });
  }

  Widget _imageNew() {
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
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
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
        builder: (context, state) {
      return Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Image(
          image: NetworkImage(state.employee!.image!.url != null
              ? state.employee!.image!.url.toString()
              : ''),
          width: 84,
          height: 84,
          fit: BoxFit.cover,
        ),
      );
    });
  }

  Widget _selectImage() {
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
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

    final formEmployeeService = BlocProvider.of<FormemployeeBloc>(context);
    final employeeService = BlocProvider.of<EmployeesBloc>(context);
    final userService = BlocProvider.of<UserBloc>(context);
    print("Apartment id ${userService.state.userInfo!.apartment!.id}");
    final params = {
      "name": state.employee!.name != null ? state.employee!.name : '',
      "phone": state.employee!.phone != null ? state.employee!.phone : '',
      "identity":
          state.employee!.identity != null ? state.employee!.identity : '',
      "image": state.image != ''
          ? 'data:image/jpeg;base64,' + state.image.toString()
          : '',
      "apartment": userService.state.userInfo?.apartment != null
          ? userService.state.userInfo!.apartment!.id
          : '',
    };
    formEmployeeService.add(ChangeLoadingEmployee(true));

    final dynamic response;
    if (state.id == null || state.id == '') {
      print("Guardando");
      response =
          await formEmployeeService.employeesRepo.saveEmployee(context, params);
    } else {
      print("Editando");
      response = await formEmployeeService.employeesRepo
          .editEmployee(context, state.id!, params);
    }

    // formEmployeeService.add( ChangeLoadingEmployee(false) );
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      final Map<String, dynamic> decodedResp = json.decode(response.body);

      if (state.id == null || state.id == '') {
        Employee? newEmployee = Employee.fromJson(decodedResp) as Employee;
        if (newEmployee != null)
          employeeService.add(LoadNewEmployee(newEmployee));
      } else {
        // Cambiar elemento del arreglo por la respuesta del servidor
        print('LoadEditEmployee');
        Employee? editEmployee = Employee.fromJson(decodedResp) as Employee;
        if (editEmployee != null)
          employeeService.add(LoadEditEmployee(editEmployee));
      }

      // Ir a la pantalla del Listado
      employeeService.add(ChangeIndex(0));
      // Resetear Formulario
      formEmployeeService.add(ResetForm(context));
    } else {
      print(response.statusCode);
    }
  }

  Widget _buttonSaveEmployee() {
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
        builder: (context, state) {
          print(state);
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
                if (state.isLoadingEmployee)
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
            state.isLoadingEmployee ? null : _onSubmit(state);
          });
    });
  }

  Widget _buttonCancel() {
    return BlocBuilder<FormemployeeBloc, FormemployeeState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'employees');
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
