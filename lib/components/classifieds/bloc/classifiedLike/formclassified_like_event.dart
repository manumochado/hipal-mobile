part of 'formclassified_like_bloc.dart';

@immutable
abstract class FormclassifiedLikeEvent {}

class LoadTypes extends FormclassifiedLikeEvent {
  final BuildContext context;
  LoadTypes(this.context);
}

class ChangeLink extends FormclassifiedLikeEvent {
  final String link;
  ChangeLink(this.link);
}

class ChangeTitle extends FormclassifiedLikeEvent {
  final String title;
  ChangeTitle(this.title);
}

class ChangePrice extends FormclassifiedLikeEvent {
  final int price;
  ChangePrice(this.price);
}

class ChangeDescription extends FormclassifiedLikeEvent {
  final String description;
  ChangeDescription(this.description);
}

class ChangeNameSeller extends FormclassifiedLikeEvent {
  final String nameSeller;
  ChangeNameSeller(this.nameSeller);
}

class ChangeEmailSeller extends FormclassifiedLikeEvent {
  final String emailSeller;
  ChangeEmailSeller(this.emailSeller);
}

class ChangeWhatsappSeller extends FormclassifiedLikeEvent {
  final String whatsappSeller;
  ChangeWhatsappSeller(this.whatsappSeller);
}


class ChangeImage extends FormclassifiedLikeEvent {
  final String image;
  ChangeImage(this.image);
}

class ResetFormClassified extends FormclassifiedLikeEvent {
  final BuildContext context;
  ResetFormClassified(this.context);
}

class ChangeLoadingClassified extends FormclassifiedLikeEvent {
  final bool isLoading;
  ChangeLoadingClassified(this.isLoading);
}


class EditClassified extends FormclassifiedLikeEvent {
  final BuildContext context;
  final Classified classified;
  EditClassified(this.context, this.classified);
}
