part of 'formclassified_bloc.dart';

@immutable
class FormclassifiedState extends Equatable {
  final String? id;
  final String? link;
  final String? title;
  final double? price;
  final String? description;
  final String? nameSeller;
  final String? whatsappSeller;
  final String? emailSeller;

  final List<ClassifiedImage> currentImages;
  final List<String> createImages;
  final List<ClassifiedImage> deletedImages;
  final bool isEditing;

  const FormclassifiedState({
    this.id,
    this.link,
    this.title,
    this.price,
    this.description,
    this.nameSeller,
    this.whatsappSeller,
    this.emailSeller,
    this.currentImages = const [],
    this.createImages = const [],
    this.deletedImages = const [],
    this.isEditing = false,
  });

  FormclassifiedState copyWith({
    String? id,
    String? link,
    String? title,
    double? price,
    String? description,
    String? nameSeller,
    String? whatsappSeller,
    String? emailSeller,
    List<ClassifiedImage>? currentImages,
    List<String>? createImages,
    List<ClassifiedImage>? deleteImages,
    bool? isEditing,
  }) =>
      FormclassifiedState(
        id: id ?? this.id,
        link: link ?? this.link,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        nameSeller: nameSeller ?? this.nameSeller,
        whatsappSeller: whatsappSeller ?? this.whatsappSeller,
        emailSeller: emailSeller ?? this.emailSeller,
        currentImages: currentImages ?? this.currentImages,
        createImages: createImages ?? this.createImages,
        deletedImages: deleteImages ?? this.deletedImages,
        isEditing: isEditing ?? this.isEditing,
      );

  FormclassifiedState createFromClassified(
          {required Classified classified, required bool isEditing}) =>
      FormclassifiedState(
          id: classified.id,
          link: classified.link,
          title: classified.title,
          price: classified.price,
          description: classified.description,
          nameSeller: classified.nameSeller,
          whatsappSeller: classified.whatsappSeller,
          emailSeller: classified.emailSeller,
          currentImages: classified.images ?? [],
          isEditing: isEditing);

  FormclassifiedState clearData() => FormclassifiedState();

  @override
  List<Object?> get props => [
        id,
        link,
        title,
        price,
        description,
        nameSeller,
        whatsappSeller,
        emailSeller,
        currentImages,
        createImages,
        deletedImages,
        isEditing,
      ];
}

class FormclassifiedInitial extends FormclassifiedState {}
