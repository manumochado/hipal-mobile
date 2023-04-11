part of 'user_bloc.dart';

abstract class UserEvent {}

class ChangeUser extends UserEvent {
  final UserInfo userinfo;
  ChangeUser(this.userinfo);
}

class ChangeFormUser extends UserEvent {
  final UserInfo userForm;
  ChangeFormUser(this.userForm);
}

class ChangeUsers extends UserEvent {
  final UserInfo userForm;
  ChangeUsers(this.userForm);
}

class ChangeUsers2 extends UserEvent {
  final UserInfo userInfo;
  ChangeUsers2(this.userInfo);
}

class ChangeFirstName extends UserEvent {
  final String name;
  ChangeFirstName(this.name);
}

class ChangeLastName extends UserEvent {
  final String name;
  ChangeLastName(this.name);
}

class ChangeIdentityUser extends UserEvent {
  final String identity;
  ChangeIdentityUser(this.identity);
}

class ChangeGender extends UserEvent {
  final String gender;
  ChangeGender(this.gender);
}

class ChangeEmailUser extends UserEvent {
  final String email;
  ChangeEmailUser(this.email);
}

class ChangePhoneUser extends UserEvent {
  ChangePhoneUser();
}

class ChangeDateUser extends UserEvent {
  final String date;
  ChangeDateUser(this.date);
}

class ChangeCityUser extends UserEvent {
  final String city;
  ChangeCityUser(this.city);
}

/*class ChangeImage extends UserEvent {
  final String image;
  ChangeImage(this.image);
}*/

class ChangeSocialNetwork extends UserEvent {
  final List list;
  ChangeSocialNetwork(this.list);
}

class ChangeLoading2 extends UserEvent {
  final bool isLoading;
  ChangeLoading2(this.isLoading);
}

class ChangeUserEdit extends UserEvent {
  final bool userEdit;
  ChangeUserEdit(this.userEdit);
}

class ChangeImageUSer extends UserEvent {
  final String image;
  ChangeImageUSer(this.image);
}

class ChangeUserNewPhoto extends UserEvent {
  final bool newPhoto;
  ChangeUserNewPhoto(this.newPhoto);
}

class GetCurrentUser extends UserEvent {
  final BuildContext context;
  bool forceLoadDB = false;
  GetCurrentUser(this.context, this.forceLoadDB);
}
