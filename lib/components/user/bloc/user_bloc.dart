import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hipal/components/user/model/apartmentUser.dart';
import 'package:hipal/components/user/model/phone.dart';
import 'package:hipal/components/user/model/photo.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/components/user/model/tower.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:hipal/components/user/repository/user_repository.dart';
import 'package:hipal/notifications/notification.dart';
import 'package:meta/meta.dart';

import '../model/city.dart';
import '../model/user.dart';
import '../model/userInfo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepo;
  var number = '';
  var countryCode = '';
  var e164Number = '';
  var internationalNumber = '';
  var nationalNumber = '';

  UserInfo proccessDataUserInfo(String field, value) {
    final UserInfo newUserInfo;
    if (state.userInfo != null) {
      final Map<String, dynamic> objectUserInfo =
          json.decode(json.encode(state.userInfo!.toJson()));
      objectUserInfo[field] = value;
      newUserInfo = UserInfo.fromJson(objectUserInfo)!;
    } else {
      Map<String, dynamic> objectUserInfo = {field: value};
      newUserInfo = UserInfo.fromJson(objectUserInfo)!;
    }

    return newUserInfo;
  }

  User proccessDataUSer(String field, value) {
    final User newUser;

    if (state.userForm?.user != null) {
      final Map<String, dynamic> objectUser =
          json.decode(json.encode(state.userForm!.user!.toJson()));
      objectUser[field] = value;
      newUser = User.fromJson(objectUser)!;
    } else {
      Map<String, dynamic> user = {field: value};
      newUser = User.fromJson(user)!;
    }

    return newUser;
  }

  Photo proccessDataPhoto(String field, value) {
    final Photo newPhoto;

    if (state.userForm?.user?.photo != null) {
      final Map<String, dynamic> objectPhoto =
          json.decode(json.encode(state.userForm!.user!.photo!.toJson()));
      objectPhoto[field] = value;
      newPhoto = Photo.fromJson(objectPhoto)!;
    } else {
      Map<String, dynamic> photo = {field: value};
      newPhoto = Photo.fromJson(photo)!;
    }

    return newPhoto;
  }

  Phone proccessDataPhone() {
    final Phone newPhone;

    if (state.userForm?.user != null) {
      final Map<String, dynamic> objectPhone =
          json.decode(json.encode(state.userForm!.user!.phone!.toJson()));
      objectPhone['number'] = this.number;
      objectPhone['countryCode'] = this.countryCode;
      objectPhone['e164Number'] = this.e164Number;
      objectPhone['internationalNumber'] = this.internationalNumber;
      objectPhone['nationalNumber'] = this.nationalNumber;
      newPhone = Phone.fromJson(objectPhone)!;
    } else {
      Map<String, dynamic> phone = {
        'number': this.number,
        'countryCode': this.countryCode,
        'e164Number': this.e164Number
      };
      newPhone = Phone.fromJson(phone)!;
    }

    return newPhone;
  }

  City proccessDataCity(String field, value) {
    final City newCity;

    if (state.userForm?.user != null) {
      final Map<String, dynamic> objectCity = json.decode(json.encode(
          state.userForm!.apartment!.tower!.residential!.city!.toJson()));
      objectCity[field] = value;
      newCity = City.fromJson(objectCity)!;
    } else {
      Map<String, dynamic> city = {field: value};
      newCity = City.fromJson(city)!;
    }

    return newCity;
  }

  Residential proccessDataResidential(String field, value) {
    final Residential newResidential;

    if (state.userForm?.user != null) {
      final Map<String, dynamic> objectnewResidential = json.decode(
          json.encode(state.userForm!.apartment!.tower!.residential!.toJson()));
      objectnewResidential[field] = value;
      newResidential = Residential.fromJson(objectnewResidential)!;
    } else {
      Map<String, dynamic> residential = {field: value};
      newResidential = Residential.fromJson(residential)!;
    }

    return newResidential;
  }

  Tower proccessDataTower(String field, value) {
    final Tower newTower;

    if (state.userForm?.user != null) {
      final Map<String, dynamic> objectnewTower =
          json.decode(json.encode(state.userForm!.apartment!.tower!.toJson()));
      objectnewTower[field] = value;
      newTower = Tower.fromJson(objectnewTower)!;
    } else {
      Map<String, dynamic> tower = {field: value};
      newTower = Tower.fromJson(tower)!;
    }

    return newTower;
  }

  ApartmentUser proccessDataApartmentUser(String field, value) {
    final ApartmentUser newApartmentUser;

    if (state.userForm?.user != null) {
      final Map<String, dynamic> objectnewApartmentUser =
          json.decode(json.encode(state.userForm!.apartment!.tower!.toJson()));
      objectnewApartmentUser[field] = value;
      newApartmentUser = ApartmentUser.fromJson(objectnewApartmentUser)!;
    } else {
      Map<String, dynamic> apartmentUser = {field: value};
      newApartmentUser = ApartmentUser.fromJson(apartmentUser)!;
    }

    return newApartmentUser;
  }

  UserBloc({required this.userRepo}) : super(UserInitial()) {
    on<GetCurrentUser>((event, emit) async {
      final storage = new FlutterSecureStorage();
      final user = await storage.read(key: 'userLogged');

      if (user == null || event.forceLoadDB == true) {
        try {
          emit(state.copyWith(isLoading: true));

          final dynamic response = await this.userRepo.getUser(event.context);
          if (response != null) {
            UserInfo? user = UserInfo.fromJson(response);
            storage.write(key: 'userLogged', value: json.encode(response));
            emit(state.copyWith(userInfo: user));
            emit(state.copyWith(userForm: user));
          }
        } finally {
          emit(state.copyWith(isLoading: false));
        }
      } else {
        final Map<String, dynamic> userDecode = json.decode(user);
        final UserInfo? userModel = UserInfo.fromJson(userDecode);
        emit(state.copyWith(userInfo: userModel));
        emit(state.copyWith(userForm: userModel));
      }
      if (user == null) {
        // save token FCM
        final firebaseMessaging = FCM();
        final token = await firebaseMessaging.getToken();
        await this.userRepo.saveToken(event.context, token);
      }
    });

    on<UserEvent>((event, emit) {});

    on<ChangeUser>((event, emit) {
      emit(state.copyWith(userInfo: event.userinfo));
    });

    on<ChangeUsers2>((event, emit) {
      emit(state.copyWith(userForm: event.userInfo));
    });

    on<ChangeFormUser>((event, emit) {
      emit(state.copyWith(userForm: event.userForm));
    });

    on<ChangeUsers>((event, emit) {
      emit(state.copyWith(userInfo: event.userForm));
    });

    on<ChangeFirstName>((event, emit) async {
      final User newUser = this.proccessDataUSer("firstname", event.name);
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangeLastName>((event, emit) async {
      final User newUser = this.proccessDataUSer("lastname", event.name);
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangeIdentityUser>((event, emit) async {
      final User newUser = this.proccessDataUSer("identity", event.identity);
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangeEmailUser>((event, emit) async {
      final User newUser = this.proccessDataUSer("email", event.email);
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangeCityUser>((event, emit) async {
      final User newUser = this.proccessDataUSer("city", event.city);
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangeGender>((event, emit) async {
      final User newUser = this.proccessDataUSer("gender", event.gender);
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangeDateUser>((event, emit) async {
      final User newUser = this.proccessDataUSer("birthDate", event.date);
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangePhoneUser>((event, emit) async {
      final Phone newPhone = this.proccessDataPhone();
      final User newUser = this.proccessDataUSer("phone", newPhone.toJson());
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangeSocialNetwork>((event, emit) async {
      final User newUser =
          this.proccessDataUSer("socialNetworks", event.list.toBuiltList());
      final UserInfo newUserInfo =
          this.proccessDataUserInfo("user", newUser.toJson());
      emit(state.copyWith(userForm: newUserInfo));
    });

    on<ChangeImageUSer>((event, emit) async {
      emit(state.copyWith(image: event.image));
    });

    on<ChangeLoading2>((event, emit) async {
      emit(state.copyWith(isLoading: event.isLoading));
    });

    on<ChangeUserEdit>((event, emit) async {
      emit(state.copyWith(isLoading: event.userEdit));
    });

    on<ChangeUserNewPhoto>((event, emit) async {
      emit(state.copyWith(newPhoto: event.newPhoto));
    });
  }
}
