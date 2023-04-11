part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final int step;
  //Data get Service
  final List<CityResponse> stateList;
  final List<MunResponse> munList;
  //Type document
  final String typeDoc;
  final String noDoc;
  final String fechaExpCed;
  final bool infHipal;
  final bool infDing;
  //End Document

  //Information Data Profile
  final String name;
  final String lastname;
  final String dateNac;
  final String genero;
  final String email;
  final city;
  final state;
  final String address;
  //End Information Data Profile
  //Phone
  final String numberPhone;
  //End Phone
  const RegisterState({
    this.step = 0,
    this.typeDoc = '',
    this.noDoc = "",
    this.fechaExpCed = "",
    this.infHipal = false,
    this.infDing = false,
    this.stateList = const [],
    this.munList = const [],
    //Data Profile State
    this.name = "",
    this.lastname = "",
    this.dateNac = "",
    this.genero = "",
    this.email = "",
    this.city = "",
    this.state = "",
    this.address = "",
    //End Data Profile
    //Phone
    this.numberPhone = "",
    //End Phone
  });
  RegisterState copyWith({
    int? step,
    String? typeDoc,
    String? noDoc,
    String? fechaExpCed,
    bool? infHipal,
    bool? infDing,
    String? name,
    String? lastname,
    String? dateNac,
    String? genero,
    String? email,
    String? city,
    String? state,
    List<CityResponse>? stateList,
    List<MunResponse>? munList,
    String? address,
    String? numberPhone,
  }) {
    return RegisterState(
      step: step ?? this.step,
      typeDoc: typeDoc ?? this.typeDoc,
      noDoc: noDoc ?? this.noDoc,
      fechaExpCed: fechaExpCed ?? this.fechaExpCed,
      infHipal: infHipal ?? this.infHipal,
      infDing: infDing ?? this.infDing,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      dateNac: dateNac ?? this.dateNac,
      genero: genero ?? this.genero,
      email: email ?? this.email,
      city: city ?? this.city,
      state: state ?? this.state,
      address: address ?? this.address,
      stateList: stateList ?? this.stateList,
      munList: munList ?? this.munList,
      numberPhone: numberPhone ?? this.numberPhone,
    );
  }

  @override
  List<Object> get props => [
        step,
        stateList,
        munList,
        typeDoc,
        noDoc,
        fechaExpCed,
        infHipal,
        infDing,
        //Data Profile
        name,
        lastname,
        dateNac,
        genero,
        email,
        city,
        state,
        address,
        //Phone
        numberPhone
      ];
}
