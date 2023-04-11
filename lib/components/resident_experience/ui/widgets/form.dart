import 'package:flutter_svg/flutter_svg.dart';
import 'package:hipal/components/resident_experience/ui/widgets/pqr_success_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/resident_experience/bloc/resident_experience_bloc.dart';
import 'package:hipal/widgets/input_decorations.dart';

class ResidentExperienceForm extends StatefulWidget {
  @override
  createState() => _ResidentExperienceForm();
}

class _ResidentExperienceForm extends State<ResidentExperienceForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _businessController;
  late TextEditingController _descriptionController;
  String? editingPqrId;
  String? typePQR;
  String? categoryPQR;

  @override
  void initState() {
    super.initState();
    _businessController = TextEditingController();
    _descriptionController = TextEditingController();

    WidgetsBinding.instance?.addPostFrameCallback((_) => initialData());
  }

  void initialData() {
    final state = BlocProvider.of<ResidentExperienceBloc>(context).state;
      _clearFormData();

    if (state.editingPQR != null) {
      editingPqrId = state.editingPQR!.id;
      categoryPQR = state.editingPQR!.category.id;
      typePQR = state.editingPQR!.type.id;
      _businessController.text = state.editingPQR!.business;
      _descriptionController.text = state.editingPQR!.description;
      BlocProvider.of<ResidentExperienceBloc>(context)
          .add(UnsetEditingPQR(context));
    } 

    if (state.pqrTypes!.length == 0 && !state.isLoadingPqrTypes) {
      BlocProvider.of<ResidentExperienceBloc>(context)
          .add(LoadPqrTypes(context));
    }

    if (state.pqrCategories!.length == 0 && !state.isLoadingPqrCategories) {
      BlocProvider.of<ResidentExperienceBloc>(context)
          .add(LoadPqrCategories(context));
    }
  }

  @override
  void dispose() {
    _businessController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffF9FAFE),
        body: SingleChildScrollView(
            child: BlocBuilder<ResidentExperienceBloc, ResidentExperienceState>(
          builder: (context, state) {
            if (state.isLoadingPqrCategories || state.isLoadingPqrTypes) {
              return Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: const Color(0xff6456EB),
                    ),
                  ));
            }
            ;

            return Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        '¿Tienes una sugerencia, queja o felicitación? ¡Informa a tu administrador para seguir mejorando tu gestión!',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff343887),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                    Card(
                      elevation: 1.5,
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            // Tipo de PQR
                            _CustomPQRDropDownField(
                              icon: SvgPicture.asset('assets/icons/question_circle.svg', height: 20),
                              labelText: 'Tipo',
                              value: typePQR,
                              items: state.pqrTypes != null
                                  ? state.pqrTypes!
                                      .map((type) => DropdownMenuItem(
                                            child: Text(
                                              type.name,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff343887),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            value: type.id,
                                          ))
                                      .toList()
                                  : null,
                              onChanged: (value) => typePQR = value,
                            ),
                            //Categoria de PQR
                            _CustomPQRDropDownField(
                              icon: SvgPicture.asset('assets/icons/search_question.svg', height: 20),
                              labelText: 'Categoria',
                              value: categoryPQR,
                              items: state.pqrCategories != null
                                  ? state.pqrCategories!
                                      .map((category) => DropdownMenuItem(
                                            child: Text(
                                              category.name,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff343887),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            value: category.id,
                                          ))
                                      .toList()
                                  : null,
                              onChanged: (value) => categoryPQR = value,
                            ),
                            //Asunto
                            _CustomPQRTextFormField(
                              controller: _businessController,
                              labelText: 'Asunto',
                              icon:
                                  const IconData(0xe934, fontFamily: 'icomoon'),
                            ),
                            // Descripcion
                            _CustomPQRTextFormField(
                              controller: _descriptionController,
                              labelText: 'Descripción',
                              maxLines: 6,
                              icon:
                                  const IconData(0xe92b, fontFamily: 'icomoon'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    _SaveButtom(
                      isProcessing: state.isSaving,
                      onPressed: _onSubmit,
                    ),

                    const SizedBox(height: 20),

                    // Cancelar
                    _CancelButtom(
                      labelText: 'Cancelar',
                      onPressed: () {
                        _clearFormData();
                        BlocProvider.of<ResidentExperienceBloc>(context)
                            .add(ChangeIndex(0));
                      },
                    )
                  ],
                ));
          },
        )));
  }

  _clearFormData() {
    editingPqrId = null;
    categoryPQR = null;
    typePQR = null;
    _businessController.text = '';
    _descriptionController.text = '';
  }

  _onSubmit() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    final Map<String, dynamic> params = {
      "type": typePQR,
      "category": categoryPQR,
      "business": _businessController.text,
      "description": _descriptionController.text
    };

    if (editingPqrId != null) {
      BlocProvider.of<ResidentExperienceBloc>(context).add(UpdatePQR(
        context,
        id: editingPqrId!,
        params: params,
        successFullyAlert: SuccessAlert(
            message:
                '¡Has editado con éxito tu PQR, pronto recibirás respuesta a tu solicitud!',
            onPressed: () {
              _clearFormData();
              BlocProvider.of<ResidentExperienceBloc>(context)
                  .add(ChangeIndex(0));
              Navigator.of(context, rootNavigator: true).pop();
            }),
      ));
    } else {
      BlocProvider.of<ResidentExperienceBloc>(context).add(CreatePQR(
        context,
        params: params,
        successFullyAlert: SuccessAlert(
            message:
                '¡Has creado con éxito tu PQR, pronto recibirás respuesta a tu solicitud!',
            onPressed: () {
              _clearFormData();
              BlocProvider.of<ResidentExperienceBloc>(context)
                  .add(ChangeIndex(0));
              Navigator.of(context, rootNavigator: true).pop();
            }),
      ));
    }
  }
}

class _SaveButtom extends StatelessWidget {
  final bool isProcessing;
  final Function()? onPressed;

  const _SaveButtom({Key? key, this.isProcessing = false, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 35),
      child: MaterialButton(
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
                isProcessing
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
                        'Enviar',
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
            isProcessing
                ? null
                : onPressed != null
                    ? onPressed!()
                    : () {};
          }),
    );
  }
}

class _CancelButtom extends StatelessWidget {
  final Function()? onPressed;
  final String labelText;
  const _CancelButtom({
    Key? key,
    required this.labelText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(labelText,
            style: const TextStyle(
              color: Color(0xff8378FC),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        onPressed: onPressed);
  }
}

class _CustomPQRTextFormField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController? controller;
  final int maxLines;

  const _CustomPQRTextFormField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.controller,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Color(0xFF8378FC)),
        const SizedBox(width: 20),
        Expanded(
          child: TextFormField(
            maxLines: maxLines,
            minLines: 1,
            controller: controller,
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
            decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: labelText,
              borderColor: Color(0xFFDFDDFD),
              sizeLabel: 13,
            ),
            validator: (value) => (value ?? '').trim().isEmpty ? '' : null,
          ),
        ),
      ],
    );
  }
}

class _CustomPQRDropDownField extends StatelessWidget {
  final Widget icon;
  final String labelText;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
  final Function(String? value)? onChanged;
  const _CustomPQRDropDownField({
    Key? key,
    required this.icon,
    required this.labelText,
    this.items,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 20),
        Expanded(
            child: DropdownButtonFormField<String>(
          value: value,
          alignment: AlignmentDirectional.center,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff8C81FE), width: 2)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE0E5F1))),
              labelText: labelText,
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
          items: items,
          onChanged: onChanged,
          validator: (value) => (value ?? '').trim().isEmpty ? '' : null,
        )),
      ],
    );
  }
}
