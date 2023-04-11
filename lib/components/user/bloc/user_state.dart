part of 'user_bloc.dart';

@immutable
class UserState {
  final bool isInit;
  final UserInfo? userInfo;
  final UserInfo? userForm;
  final String title;
  final String? image;
  final bool newPhoto;
  final bool isLoading;
  final bool userEdit;
  //bool get isValidNumber => new RegExp(r'[^0-9]').hasMatch(userInfo?.user?.identity != null ? userInfo!.user!.identity!.toString() : "") ? true : false;
  bool get isValidEmail => new RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(userInfo?.user?.email != null ? userInfo!.user!.email!.toString() : "") ? true : false;


  const UserState({
    this.userInfo,
    this.userForm,
    this.image,
    this.isInit = false,
    this.title = 'Mi cuenta',
    this.newPhoto = false,
    this.isLoading = false,
    this.userEdit = false
  });

  UserState copyWith({
    bool? isInit,
    UserInfo? userInfo,
    UserInfo? userForm,
    String? title,
    String? image,
    bool isLoading = false,
    bool newPhoto = false,
    bool userEdit = false
  }) => UserState(
    isInit: isInit ?? this.isInit,
    userInfo: userInfo ?? this.userInfo,
      userForm: userForm ?? this.userForm,
    title: title ?? this.title,
    image: image ?? this.image,
    isLoading: isLoading,
    newPhoto: newPhoto,
    userEdit: userEdit
  );
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}
