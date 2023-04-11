import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/widgets/input_decorations.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PersonalInformation extends StatefulWidget {
  bool fieldactive = false;

  PersonalInformation({required this.fieldactive});

  _PersonalInformation createState() => _PersonalInformation();
}

class _PersonalInformation extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Column(
        children: [
          Row(children: [Expanded(child: _fullNameField())]),
          Row(children: [
            Expanded(child: _idField()),
            Expanded(child: _genderTypeField())
          ]),
          Row(children: [Expanded(child: _emailField())]),
          Row(children: [
            Expanded(child: _phoneField()),
            Expanded(child: _dateBirthField())
          ]),
          Row(children: [Expanded(child: _cityCountryField())]),
        ],
      );
    });
  }

  Widget _fullNameField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String name = "";
      String lastName = "";

      if (state.userInfo?.user?.firstname != null) {
        name += state.userInfo!.user!.firstname.toString();
      }

      if (state.userInfo?.user?.lastname != null) {
        lastName += state.userInfo!.user!.lastname.toString();
      }

      return Container(
        margin: const EdgeInsets.only(right: 10, left: 20),
        height: 70,
        child: TextFormField(
          enabled: widget.fieldactive,
          initialValue: name + " " + lastName,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Nombre completo',
              borderColor: Color(0xFFE0E5F1),
              sizeLabel: 13),
        ),
      );
    });
  }

  Widget _firstnameField() {
    return BlocBuilder<UserBloc, UserState>(buildWhen: (previousState, state) {
      if (state.userEdit) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      String name = "";
      if (state.userInfo?.user?.firstname != null) {
        name += state.userInfo!.user!.firstname.toString();
      }
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          initialValue: name,
          enabled: widget.fieldactive,
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
      String name = "";
      if (state.userInfo?.user?.lastname != null) {
        name += " " + state.userInfo!.user!.lastname.toString();
      }
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: TextFormField(
          initialValue: name,
          enabled: widget.fieldactive,
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
          enabled: widget.fieldactive,
          initialValue: state.userInfo?.user?.identity != null
              ? state.userInfo!.user!.identity.toString()
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
          validator: (value) => value != "" ? null : '',
        ),
      );
    });
  }

  Widget _genderTypeField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      String gender = " ";
      if (state.userInfo?.user?.gender != null) {
        if (state.userInfo?.user?.gender == "Female") {
          gender = "Femenino";
        } else if (state.userInfo?.user?.gender == "Male") {
          gender = "Masculino";
        } else {
          gender = "No definido";
        }
      }
      return Container(
          child: Padding(
        padding: EdgeInsets.only(right: 10, left: 20, top: 5, bottom: 0),
        child: PopupMenuButton(
            enabled: widget.fieldactive,
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
                              gender,
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
          enabled: widget.fieldactive,
          initialValue: state.userInfo?.user?.email != null
              ? state.userInfo!.user!.email.toString()
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
        ),
      );
    });
  }

  Widget _phoneField() {
    return BlocBuilder<UserBloc, UserState>(buildWhen: (previousState, state) {
      if (state.userEdit) {
        return true;
      } else {
        return false;
      }
    }, builder: (context, state) {
      String phone = "";
      if (state.userInfo?.user?.phone?.internationalNumber != null) {
        phone = state.userInfo!.user!.phone!.number.toString();
      }
      PhoneNumber numberPhone = PhoneNumber(phoneNumber: phone);
      return Container(
          child: Container(
        margin: const EdgeInsets.only(right: 10, left: 20),
        height: 70,
        child: TextFormField(
          initialValue: numberPhone.phoneNumber,
          enabled: widget.fieldactive,
          keyboardType: TextInputType.number,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'N° celular',
              borderColor: Color(0xFFDFDDFD),
              sizeLabel: 13),
          onChanged: (value) => context.read<UserBloc>().add(ChangePhoneUser()),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      ));
    });
  }

  Widget _dateBirthField() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.only(right: 10, left: 20),
        height: 70,
        child: TextFormField(
          enabled: false,
          initialValue: state.userInfo?.user?.birthDate != null
              ? DateFormat('yyyy-MM-dd')
                  .format(state.userForm!.user!.birthDate!)
              : '',
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Fecha de nacimiento',
              borderColor: Color(0xFFE0E5F1),
              sizeLabel: 13),
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
          enabled: false,
          initialValue: city,
          autocorrect: false,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Color(0xff5C5D87), fontWeight: FontWeight.bold),
          decoration: InputDecorations.authInputDecoration(
              hintText: '',
              labelText: 'Ciudad / País',
              borderColor: Color(0xFFE0E5F1),
              sizeLabel: 13),
          onChanged: (value) =>
              context.read<UserBloc>().add(ChangeCityUser(value)),
          validator: (value) => (value == null || value == '') ? '' : null,
        ),
      );
    });
  }
}
