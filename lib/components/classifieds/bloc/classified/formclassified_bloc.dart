import 'package:equatable/equatable.dart';
import 'package:hipal/components/classifieds/model/classifieds_response.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hipal/components/classifieds/repository/classifieds_repository.dart';


part 'formclassified_event.dart';
part 'formclassified_state.dart';

class FormclassifiedBloc extends Bloc<FormclassifiedEvent, FormclassifiedState> {
  final ClassifiedsRepository classifiedsRepo;

  FormclassifiedBloc({required this.classifiedsRepo}) : super(FormclassifiedInitial()) {

    on<ChangeLink>((event, emit) async {
      emit( state.copyWith( link: event.link ));
    });

    on<ChangeTitle>((event, emit) async {
      emit( state.copyWith( title: event.title ));
    });

    on<ChangePrice>((event, emit) async {
      emit( state.copyWith( price: event.price ));
    });

    on<ChangeDescription>((event, emit) async {
      emit( state.copyWith( description: event.description ));
    });

    on<ChangeNameSeller>((event, emit) async {
      emit( state.copyWith( nameSeller: event.nameSeller ));
    });

    on<ChangeWhatsappSeller>((event, emit) async {
      emit( state.copyWith( whatsappSeller: event.whatsappSeller ));
    });

    on<ChangeEmailSeller>((event, emit) async {
      emit( state.copyWith( emailSeller: event.emailSeller ));
    });

    on<AddImage>((event, emit) async {
      List<String>? base64images = [ event.base64image, ...state.createImages ];
      emit( state.copyWith( createImages: base64images));
    });

    on<DeleteExistingImage>((event, emit) async {    
        final imagesToDelete = state.currentImages.where((element) => element.id == event.image.id).toList();        
        final List<ClassifiedImage> newImages =
            state.currentImages.where((element) => element.id != event.image.id).toList();
      emit( state.copyWith( deleteImages: [...state.deletedImages, ...imagesToDelete], currentImages: newImages ));
    });

    on<DeleteBase64Image>((event, emit) async {           
        final List<String> newImages =
            state.createImages.where((element) => element != event.base64image).toList();

      emit( state.copyWith( createImages: newImages ));
    });

    on<ResetFormClassified>((event, emit) async {
      emit( state.clearData());
    });

    on<SetEditingClassified>((event, emit) async {
      emit( state.createFromClassified(classified: event.classified, isEditing: true));
    });

  }
}
