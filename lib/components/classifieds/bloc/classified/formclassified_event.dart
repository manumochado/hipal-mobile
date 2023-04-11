part of 'formclassified_bloc.dart';

@immutable
abstract class FormclassifiedEvent {}

class ChangeLink extends FormclassifiedEvent {
  final String link;
  ChangeLink(this.link);
}
class ChangeTitle extends FormclassifiedEvent {
  final String title;
  ChangeTitle(this.title);
}
class ChangePrice extends FormclassifiedEvent {
  final double price;
  ChangePrice(this.price);
}
class ChangeDescription extends FormclassifiedEvent {
  final String description;
  ChangeDescription(this.description);
}
class ChangeNameSeller extends FormclassifiedEvent {
  final String nameSeller;
  ChangeNameSeller(this.nameSeller);
}
class ChangeWhatsappSeller extends FormclassifiedEvent {
  final String whatsappSeller;
  ChangeWhatsappSeller(this.whatsappSeller);
}
class ChangeEmailSeller extends FormclassifiedEvent {
  final String emailSeller;
  ChangeEmailSeller(this.emailSeller);
}
class AddImage extends FormclassifiedEvent {
  final String base64image;
  AddImage(this.base64image);
}
class DeleteExistingImage extends FormclassifiedEvent {
  final ClassifiedImage image;
  DeleteExistingImage(this.image);
}
class DeleteBase64Image extends FormclassifiedEvent {
  final String base64image;
  DeleteBase64Image(this.base64image);
}
class ResetFormClassified extends FormclassifiedEvent {
  final BuildContext context;
  ResetFormClassified(this.context);
}
class SetEditingClassified extends FormclassifiedEvent {
  final BuildContext context;
  final Classified classified;
  SetEditingClassified(this.context, this.classified);
}

