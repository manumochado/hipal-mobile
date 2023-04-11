import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classified/formclassified_bloc.dart';
import 'package:hipal/components/classifieds/ui/screens/classifieds_screen.dart';
import 'package:hipal/components/classifieds/ui/widgets/classified_carousel.dart';
import 'package:hipal/services/notification_service.dart';
import 'package:hipal/widgets/gradient_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hipal/widgets/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../user/bloc/user_bloc.dart';

class ClassifiedsForm extends StatefulWidget {
  ClassifiedsForm({Key? key}) : super(key: key);
  @override
  _ClassifiedsForm createState() => _ClassifiedsForm();
}

class _ClassifiedsForm extends State<ClassifiedsForm> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  String userId = "";

  //contoladores del fomrmulario
  final titleCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final nameWASCtrl = TextEditingController();
  final numberWASCtrl = TextEditingController();
  final emailWASCtrl = TextEditingController();
  final linkCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      final initialFormState = context.read<FormclassifiedBloc>().state;
      titleCtrl.text = initialFormState.title ?? '';
      priceCtrl.text = initialFormState.price?.toString() ?? '';
      descriptionCtrl.text = initialFormState.description ?? '';
      nameWASCtrl.text = initialFormState.nameSeller ?? '';
      numberWASCtrl.text = initialFormState.whatsappSeller ?? '';
      emailWASCtrl.text = initialFormState.emailSeller ?? '';
      linkCtrl.text = initialFormState.link ?? '';
      userId = BlocProvider.of<UserBloc>(context)
              .state
              .userInfo
              ?.user
              ?.id
              .toString() ??
          "";
    });
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    priceCtrl.dispose();
    descriptionCtrl.dispose();
    nameWASCtrl.dispose();
    numberWASCtrl.dispose();
    emailWASCtrl.dispose();
    linkCtrl.dispose();
    super.dispose();
  }

  Future selectedImage(option) async {
    XFile? pickedFile;
    if (option == 1) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }

    if (pickedFile != null) {
      File? imageCrop = await cropImage(pickedFile);
      if (imageCrop != null) {
        List<int> imageBytes = imageCrop.readAsBytesSync();
        String photoBase64 = base64Encode(imageBytes);
        BlocProvider.of<FormclassifiedBloc>(context).add(AddImage(photoBase64));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool imageTrue = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo
            ?.user
            ?.photo
            ?.url
            .toString()
            .isNotEmpty ??
        false;
    String userImage = BlocProvider.of<UserBloc>(context)
            .state
            .userInfo
            ?.user
            ?.photo
            ?.url
            .toString() ??
        "assets/images/users.png";

    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return WillPopScope(
        onWillPop: () {
          context.read<FormclassifiedBloc>().add(ResetFormClassified(context));
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(state.isEditing
                ? 'Actualizar clasificado'
                : 'Crear clasificado'),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(124, 66, 222, 1),
          ),
          backgroundColor: Color(0xffF9FAFE),
          body: Stack(
            children: [
              Container(
                height: 80,
                padding: EdgeInsets.only(bottom: 25),
                color: Color.fromRGBO(124, 66, 222, 1),
                child: Center(
                  child: Container(
                    height: 80,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: imageTrue
                                      ? NetworkImage(userImage)
                                      : AssetImage(userImage) as ImageProvider,
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    '${BlocProvider.of<UserBloc>(context).state.userInfo!.user!.firstname.toString()} ${BlocProvider.of<UserBloc>(context).state.userInfo!.user!.lastname.toString()}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily:
                                            'BasicCommercial LT Roman')),
                                Text(
                                  '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}'
                                              .length >
                                          30
                                      ? '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}'
                                              .substring(0, 30) +
                                          '...'
                                      : '${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.tower!.name.toString()}, ${BlocProvider.of<UserBloc>(context).state.userInfo!.apartment!.name.toString()}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'BasicCommercial LT Roman'),
                                ),
                              ]),
                        ]),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 65),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClassifiedsCarousel(
                            images: state.currentImages,
                            base64images: state.createImages,
                            onDeleteBase64Image: (value) {
                              context
                                  .read<FormclassifiedBloc>()
                                  .add(DeleteBase64Image(value));
                            },
                            onDeleteExistingImage: (value) {
                              context
                                  .read<FormclassifiedBloc>()
                                  .add(DeleteExistingImage(value));
                            },
                          ),
                          Container(
                            height: 121,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(249, 250, 254, 1),
                                borderRadius: BorderRadius.circular(22)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 33,
                                      height: 33,
                                      decoration: BoxDecoration(
                                          color: Color(0xffDFDDFD),
                                          borderRadius:
                                              BorderRadius.circular(33)),
                                      child: Image.asset(
                                          'assets/images/upImage.png')),
                                  TextButton(
                                    onPressed: () => {_selectImage()},
                                    child: Text('Agregar foto',
                                        style: const TextStyle(
                                          color: Color(0xff8378FC),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 25, bottom: 15),
                            child: Text(
                              'Información del artículo',
                              style: TextStyle(
                                  color: Color(0xff343887),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          _titleField(),
                          _priceField(),
                          _descriptionField(),
                          Container(
                            margin: EdgeInsets.only(top: 25, bottom: 15),
                            child: Text(
                              'Información del vendedor',
                              style: TextStyle(
                                  color: Color(0xff343887),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          _nameSellerField(),
                          _whatsappSellerField(),
                          _emailSellerField(),
                          const SizedBox(height: 30),
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 38, top: 30, right: 38),
                              child: _buttonSaveClassified()),
                          Container(
                            margin: const EdgeInsets.only(top: 30, bottom: 100),
                            child: _buttonCancel(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _selectImage() {
    final act = CupertinoActionSheet(
        title: Text('Seleccione una opción'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('Tomar una foto',
                style: TextStyle(color: Color(0xff8378FC), fontSize: 15)),
            onPressed: () {
              selectedImage(1);
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Seleccionar de la galería',
                style: TextStyle(color: Color(0xff8378FC), fontSize: 15)),
            onPressed: () {
              selectedImage(2);
              Navigator.pop(context);
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Cancelar',
              style: TextStyle(color: Color(0xffE43C45), fontSize: 17)),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
    showCupertinoModalPopup(
        context: context, builder: (BuildContext context) => act);
  }

  Widget _linkField() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return TextFormField(
        controller: linkCtrl,
        autocorrect: false,
        keyboardType: TextInputType.text,
        validator: (value) => (validateUrl(value ?? '') == false) ? '' : null,
        style: TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
        decoration: InputDecorations.authInputDecoration(
            hintText: '',
            labelText: 'Pegar link de video',
            borderColor: Color(0xFFE0E5F1),
            suffixIcon: state.link != null
                ? Icon(
                    const IconData(0xe91e, fontFamily: 'icomoon'),
                    color: Color(0xff4DA979),
                  )
                : null),
      );
    });
  }

  Widget _titleField() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return Container(
        height: 75,
        child: TextFormField(
          controller: titleCtrl,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Título',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: state.title != null
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _priceField() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return Container(
        height: 75,
        child: TextFormField(
          controller: priceCtrl,
          autocorrect: false,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Precio',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: (state.price != null)
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _descriptionField() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return Container(
        height: 75,
        child: TextFormField(
          controller: descriptionCtrl,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Descripción',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: state.description != null
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _nameSellerField() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return Container(
        height: 75,
        child: TextFormField(
          controller: nameWASCtrl,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nombre',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: state.nameSeller != null
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }

  Widget _whatsappSellerField() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return Container(
        height: 75,
        child: TextFormField(
          controller: numberWASCtrl,
          autocorrect: false,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nº WhatsApp',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: state.whatsappSeller != null
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
          validator: (value) =>
              (value == null || value == '' || value.length != 10) ? '' : null,
        ),
      );
    });
  }

  Widget _emailSellerField() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return Container(
        height: 75,
        child: TextFormField(
          controller: emailWASCtrl,
          autocorrect: false,
          validator: (value) =>
              (value == null || value == '' || validateEmail(value) == false)
                  ? ''
                  : null,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Email',
              borderColor: Color(0xFFE0E5F1),
              suffixIcon: state.emailSeller != null
                  ? Icon(
                      const IconData(0xe91e, fontFamily: 'icomoon'),
                      color: Color(0xff4DA979),
                    )
                  : null),
        ),
      );
    });
  }

  bool validateEmail(String email) {
    final RegExp regex =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
    return regex.hasMatch(email);
  }

  bool validateUrl(String url) {
    if (url.length > 0) {
      return Uri.tryParse(url)?.hasAbsolutePath ?? false;
    }

    return true;
  }

  _onSavingComplete(bool isEditing) {
    BlocProvider.of<FormclassifiedBloc>(context)
        .add(ResetFormClassified(context));
    Alert(
      context: context,
      content: confirmPopup(
          "Tu clasificado ha sido ${isEditing ? "actualizado" : 'creado'} correctamente.",
          "Entendido",
          context),
      style: AlertStyle(isButtonVisible: false, isCloseButton: false),
    ).show();
  }

  _onSubmit(FormclassifiedState state) async {
    FocusScope.of(context).unfocus();
    // Validate Form
    if (!_formKey.currentState!.validate()) return;

    if (state.isEditing &&
        state.createImages.length == 0 &&
        state.currentImages.length == 0) {
      NotificationService.showToast(context,
          message: 'El clasificado debe contener al menos una foto');
      return;
    } else if (state.createImages.length == 0 && !state.isEditing) {
      NotificationService.showToast(context,
          message: 'El clasificado debe contener al menos una foto');
      return;
    }

    final Map? phone = {
      "countryCode": "CO",
      "dialCode": "+57",
      "e164Number": "+57${numberWASCtrl.text}",
      "internationalNumber": "+57 ${numberWASCtrl.text}",
      "nationalNumber": numberWASCtrl.text,
      "number": numberWASCtrl.text,
    };

    final imagesDelete = [];
    for (final image in state.deletedImages) {
      imagesDelete.add({
        "_id": image.id,
        "key": image.key,
        "url": image.url,
      });
    }

    final params = {
      "link": state.link ?? '',
      "title": titleCtrl.text,
      "price": priceCtrl.text,
      "description": descriptionCtrl.text,
      "nameSeller": nameWASCtrl.text,
      "emailSeller": emailWASCtrl.text,
      "whatsappSeller": phone,
      "publish": 'Residential',
      "imagesDelete": imagesDelete,
    };

    state.isEditing
        ? params['imagesCreate'] = state.createImages
            .map((e) => 'data:image/jpeg;base64,${e}')
            .toList()
        : params['images'] = state.createImages
            .map((e) => 'data:image/jpeg;base64,${e}')
            .toList();

    if (state.isEditing) {
      context.read<ClassifiedsBloc>().add(UpdateClassified(
            context,
            id: state.id!,
            params: params,
            onComplete: () => _onSavingComplete(state.isEditing),
          ));
    } else {
      context.read<ClassifiedsBloc>().add(CreateNewClassified(
            context,
            params: params,
            onComplete: () => _onSavingComplete(state.isEditing),
          ));
    }
  }

  confirmPopup(description, text_button, context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45.0, bottom: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
          ),
          child: SizedBox(
            height: 60,
            width: 60,
            child: ClipRRect(
                child: Image.asset(
              "assets/icons/start_icon.png",
              isAntiAlias: true,
              fit: BoxFit.fill,
            )),
          ),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 26.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0),
            )),
        GradientButton(text_button, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ClassifiedsScreen()));
        }, null)
      ],
    );
  }

  Widget _buttonSaveClassified() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
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
              padding: EdgeInsets.symmetric(horizontal: 54, vertical: 18),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                context.watch<ClassifiedsBloc>().state.isSaving
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
                        state.isEditing ? "Actualizar" : 'Publicar',
                        textAlign: TextAlign.center,
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
            context.read<ClassifiedsBloc>().state.isSaving
                ? null
                : _onSubmit(state);
          });
    });
  }

  Widget _buttonCancel() {
    return BlocBuilder<FormclassifiedBloc, FormclassifiedState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Center(
          child: MaterialButton(
            onPressed: () {
              state.isEditing
                  ? Navigator.pop(context)
                  : context
                      .read<ClassifiedsBloc>()
                      .add(ChangeClassifiedsTabIndex(1));
              context
                  .read<FormclassifiedBloc>()
                  .add(ResetFormClassified(context));
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
        maxWidth: 1000,
        maxHeight: 1000,
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
