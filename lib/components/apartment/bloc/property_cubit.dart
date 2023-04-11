import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/apartment/model/ResponseApartament.dart';
import 'package:hipal/components/apartment/repository/apartament_repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../widgets/gradient_button.dart';
import '../model/ApartamentUpdate.dart' as Ap;

part 'property_state.dart';

class PropertyCubit extends Cubit<PropertyState> {
  final ApartamentRepository apartamentRepository;
  PropertyCubit({required this.apartamentRepository})
      : super(const PropertyState());

  List<Ap.Parking> aparcamentoForms = List.empty(growable: true);
  late ResponseApartament apartamentCubit;
  void matChanged(String name) {
    emit(state.copyWith(matController: name));
  }

  void loadApartamentInfo(String idApart, BuildContext context) async {
    final response =
        await this.apartamentRepository.getApartament(context, idApart);
    if (response != null && response.statusCode == 200) {
      final apartamentResponse = json.decode(response.body);
      apartamentCubit = ResponseApartament.fromJson(apartamentResponse);
      emit(state.copyWith(
          areaController: apartamentCubit.area.toString(),
          depController: apartamentCubit.deposit,
          matController: apartamentCubit.realEstateRegistration));
      if (apartamentCubit.parkings != null) {
        aparcamentoForms = apartamentCubit.parkings!.map((e) {
          return Ap.Parking(
              id: e.id,
              name: e.name,
              realEstateRegistration: e.realEstateRegistration);
        }).toList();
      }
    }
  }

  void areaChanged(String age) {
    emit(state.copyWith(areaController: age));
  }

  void DepChanged(String email) {
    emit(state.copyWith(depController: email));
  }

  //void resetRegisterData() {
  //  emit(const RegisterState());
  //}

  void isEditChanged(bool isEdit) {
    emit(state.copyWith(isEdit: isEdit));
  }

  void isLoading(bool isLoading) {
    emit(state.copyWith(isLoading: true, isEdit: false));
  }

  void savePropertyUpdate(String idApart, BuildContext context) async {
    if (onValidateAp() &&
        state.matController != '' &&
        state.areaController != '' &&
        state.depController != '') {
      final parqList = aparcamentoForms.isEmpty ? [] : aparcamentoForms;
      final dataParq = parqList != '' ? parqList : '';
      final jsonBody = {
        "area": state.areaController,
        "deposit": state.depController.toString(),
        "realEstateRegistration": state.matController.toString(),
        "parkings": dataParq
      };
      final response = await this
          .apartamentRepository
          .editApartament(context, idApart, json.encode(jsonBody));
      if (response != null && response.statusCode == 200) {
        emit(state.copyWith(isLoading: false, isEdit: false));
        Alert(
                context: context,
                content: confirmPopup(context),
                style: AlertStyle(isButtonVisible: false, isCloseButton: false))
            .show();
      } else {
        emit(state.copyWith(isLoading: false, isEdit: false));
      }
    } else {
      emit(state.copyWith(isLoading: false, isEdit: true));
      confirmPopup(context,
          errorName: "El formulario de parqueaderos no es válido");
    }
  }

  convertListAparcamentoJson(parking) {
    var parqueaderomap = parking.map((e) {
      return {
        "_id": e.id,
        "name": e.name,
        "realEstateRegistration": e.realEstateRegistration,
      };
    }).toList();
    String stringparqueadero = json.encode(parqueaderomap);
    print(stringparqueadero);
    return stringparqueadero;
  }

  bool onValidateAp() {
    bool allValid = true;
    //If any form validation function returns false means all forms are not valid
    aparcamentoForms.forEach((element) => allValid = (allValid &&
        element.name != '' &&
        element.realEstateRegistration != ''));
    return allValid;
  }

  //Alert Show
  confirmPopup(context,
      {String errorName: "Apartamento actualizado exitosamente"}) {
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
              errorName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0),
            )),
        GradientButton("Aceptar", () {
          Navigator.of(context, rootNavigator: true).pop();
        }, null)
      ],
    );
  }
}
