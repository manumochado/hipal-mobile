class Power {
  late String giverUserPower;
  late ExternalUserOwnerPower externalUserOwnerPower;
  List<String> usersRepresenting = [];
  late String assembly;
  String? userOwnerPower;
  bool isExternal = true;

  Power(
      {required this.giverUserPower,
      required this.externalUserOwnerPower,
      required this.usersRepresenting,
      required this.assembly,
      this.userOwnerPower,
      required this.isExternal});

  Power.fromJson(Map<String, dynamic> json) {
    giverUserPower = json['giver_user_power'];
    externalUserOwnerPower = json['external_user_owner_power']; 
    usersRepresenting = json['users_representing'].cast<String>();
    assembly = json['assembly'];
    userOwnerPower = json['user_owner_power'];
    isExternal = json['is_external'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['giver_user_power'] = this.giverUserPower;
    if (this.externalUserOwnerPower != null) {
      data['external_user_owner_power'] = this.externalUserOwnerPower.toJson();
    }
    if (this.usersRepresenting != null) {
      data['users_representing'] =
          this.usersRepresenting.map((v) => v).toList();
    }
    data['assembly'] = this.assembly;
    data['user_owner_power'] = this.userOwnerPower;
    data['is_external'] = this.isExternal;
    return data;
  }

  //toMap

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'giver_user_power': giverUserPower,
      'external_user_owner_power': externalUserOwnerPower,
      'users_representing': usersRepresenting,
      'assembly': assembly,
      'user_owner_power': userOwnerPower,
      'is_external': isExternal,
    };
    return map;
  }
}

class ExternalUserOwnerPower {
  String fullname= '';
  String identity= '';
  String email= '';

  ExternalUserOwnerPower({required this.fullname, required this.identity, required this.email});

  ExternalUserOwnerPower.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    identity = json['identity'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['identity'] = this.identity;
    data['email'] = this.email;
    return data;
  }

  //toMap

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'fullname': fullname,
      'identity': identity,
      'email': email,
    };
    return map;
  }
}