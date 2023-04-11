part of 'resident_experience_bloc.dart';

@immutable
abstract class ResidentExperienceEvent {}

class LoadResidentExperiences extends ResidentExperienceEvent {
  final BuildContext context;
  final bool refresh;
  LoadResidentExperiences(this.context, {this.refresh = false});
}
class LoadPqrTypes extends ResidentExperienceEvent {
  final BuildContext context;
  LoadPqrTypes(this.context);
}

class LoadPqrCategories extends ResidentExperienceEvent {
  final BuildContext context;
  LoadPqrCategories(this.context);
}

class CreatePQR extends ResidentExperienceEvent {
  final BuildContext context;
  final Map<String, dynamic> params;
  final Widget successFullyAlert;
  CreatePQR(this.context, {required this.params, required this.successFullyAlert});
}

class UpdatePQR extends ResidentExperienceEvent {
  final BuildContext context;
  final String id;
  final Map<String, dynamic> params;
  final Widget successFullyAlert;
  UpdatePQR(this.context, {required this.id, required this.params, required this.successFullyAlert});
}

class RatePQR extends ResidentExperienceEvent {
  final BuildContext context;
  final String id;
  final int score;
  RatePQR(this.context, {required this.id, required this.score});
}

class DeletePQR extends ResidentExperienceEvent {
  final BuildContext context;
  final String id;
  DeletePQR(this.context, this.id);
}

class ChangeIndex extends ResidentExperienceEvent {
  final int index;
  ChangeIndex(this.index);
}

class SetEditingPQR extends ResidentExperienceEvent {
  final BuildContext context;
  final ResidentExperience pqr;
  SetEditingPQR(this.context, this.pqr);
}

class SetResponsePQR extends ResidentExperienceEvent {
  final BuildContext context;
  final ResidentExperience pqr;
  SetResponsePQR(this.context, this.pqr);
}

class SetResponsePQRById extends ResidentExperienceEvent {
  final BuildContext context;
  final String id;
  SetResponsePQRById(this.context, this.id);
}

class UnsetEditingPQR extends ResidentExperienceEvent {
  final BuildContext context;
  UnsetEditingPQR(this.context);
}