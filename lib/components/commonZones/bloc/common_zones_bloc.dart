import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as Img;
import 'package:hipal/components/commonZones/model/zone_model.dart' as Common;
import 'package:hipal/components/commonZones/repository/common_zones_repository.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/serializers/typefilter.dart';
import 'package:meta/meta.dart';
import 'package:toast/toast.dart';

import '../../../widgets/gradient_button.dart';
import '../../friends/model/friends.dart';
import '../model/reservations.dart';
import '../model/zone_model.dart';
import '../ui/widgets/select_schedule.dart';

part 'common_zones_event.dart';
part 'common_zones_state.dart';

class CommonZonesBloc extends Bloc<CommonZonesEvent, CommonZonesState> {
  final CommonZonesRepository commonZonesRepo;
  params(String page, String limit) {
    return "?page=" + page + "&limit=" + '50' + "&filters=enabled==true";
  }

  Reservations proccessData(String field, value) {
    final Reservations newReservation;

    if (state.reservation != null) {
      final Map<String, dynamic> objectReservation =
          json.decode(json.encode(state.reservation!.toJson()));
      objectReservation[field] = value;
      newReservation = Reservations.fromJson(objectReservation);
    } else {
      Map<String, dynamic> reservation = {field: value};
      newReservation = Reservations.fromJson(reservation);
    }

    return newReservation;
  }

  _friends(event, emit) {
    List<Friends> newGuests = [
      event.friend as Friends,
      ...?state.guest,
    ];
    List<Friends> newListFriends = [
      event.friend,
      ...?state.listFriends,
    ];
    ToastContext().init(event.context);
    Toast.show("${event.friend.name} fue añadido a la lista",
        duration: Toast.lengthLong, gravity: Toast.center);
    emit(state.copyWith(guest: newGuests, listFriends: newListFriends));
  }

  confirmPopup(context,
      {String errorName:
          "¡Has reservado con éxito, disfruta de las instalaciones de tu edificio!",
      isInfo: false,
      goTo: ''}) {
    return Column(
      children: [
        if (!isInfo)
          Container(
            margin: EdgeInsets.only(top: 45.0, bottom: 24.0),
            child: SizedBox(
              height: 95.0,
              width: 117.0,
              child: ClipRRect(
                  child: Img.Image.asset(
                "assets/images/start.png",
                isAntiAlias: true,
                fit: BoxFit.fill,
              )),
            ),
          ),
        Text(
          isInfo ? 'Información' : '¡Muy Bien!',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF6C7192),
              fontWeight: FontWeight.w600,
              fontSize: 20.0),
        ),
        SizedBox(height: isInfo ? 10.0 : 5.0),
        Container(
            margin: EdgeInsets.only(bottom: 26.0),
            child: Text(
              errorName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF6C7192),
                  fontWeight: FontWeight.w600,
                  fontSize: 13.0),
            )),
        GradientButton("Entendido", () {
          if (isInfo) {
            Navigator.of(context, rootNavigator: true).pop();
          } else {
            Navigator.of(context, rootNavigator: true)
                .pushReplacementNamed(goTo);
          }
        }, null)
      ],
    );
  }

  CommonZonesBloc({required this.commonZonesRepo})
      : super(CommonZonesInitial()) {
    on<CommonZonesEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ResetForm>((event, emit) async {
      emit(state.copyWith(
          selectedDate: '',
          cost: '',
          start: '',
          end: '',
          isEditing: false,
          listFriends: [],
          guest: []));
    });

    //Friend
    on<DeleteGuestReservation>((event, emit) async {
      List<Friends> newFriends = [];
      for (var friend in state.listFriends!) {
        if (friend.id != event.id) {
          newFriends.add(friend);
        }
      }
      emit(state.copyWith(listFriends: newFriends, guest: newFriends));
    });

    on<AddGuestReservation>((event, emit) async {
      if (state.guest != null && state.guest!.length > 0) {
        bool found = false;
        for (var guest in state.guest!) {
          if (guest.id == event.friend.id) {
            found = true;
          }
        }
        if (!found) {
          _friends(event, emit);
        } else {
          ToastContext().init(event.context);
          Toast.show("${event.friend.name} ya fue añadido a la lista",
              duration: Toast.lengthLong, gravity: Toast.center);
        }
      } else {
        _friends(event, emit);
      }
    });

    on<AddListGuestReservation>((event, emit) async {
      final Reservations newReservation = this
          .proccessData("guests", json.decode(json.encode(event.idsFriends)));
      emit(state.copyWith(reservation: newReservation));
    });

    on<LoadTypeZone>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final param = params(state.page.toString(), state.limit.toString());
      final response =
          await this.commonZonesRepo.getTypeZones(event.context, param);
      if (response != null && response.statusCode == 200) {
        final typeZonesResponse = json.decode(response.body);
        final List<Common.TypeZone> typeZones = typeZonesResponse['data']
            .map((e) => Common.TypeZone.fromJson(e))
            .toList()
            .cast<Common.TypeZone>();
        emit(state.copyWith(typeZones: typeZones, isLoading: false));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<LoadCommonZonesForID>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final response = await this
          .commonZonesRepo
          .getCommonZonesForId(event.context, event.id);
      if (response != null && response.statusCode == 200) {
        final commonZoneResponse = json.decode(response.body);
        emit(state.copyWith(
            selectedZone: Common.TypeZone.fromJson(commonZoneResponse),
            isLoading: false));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<LoadCommonZonesForIDAndDate>((event, emit) async {
      //final Reservations newReservation = this.proccessData("date", event.date);
      emit(state.copyWith(isLoading: true));
      final response = await this
          .commonZonesRepo
          .getCommonZonesForIdDate(event.context, event.id, event.date);
      if (response != null && response.statusCode == 200) {
        Common.TypeZone selected =
            Common.TypeZone.fromJson(json.decode(response.body));
        if (selected.schedule?.length == 0) {
          emit(state.copyWith(isLoading: false));
          return showDialog(
              context: event.context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('Información'),
                  content: const Text(
                      'No hay horarios disponibles para la fecha seleccionada'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(event.context);
                        },
                        child: const Text('Aceptar')),
                  ],
                );
              });
        } else {
          Navigator.push(
              event.context,
              MaterialPageRoute(
                  builder: (context) =>
                      SelectSchedule(state.selectedZone?.costPerHour)));
          emit(state.copyWith(
              selectedZone: selected,
              selectedDate: event.date,
              isLoading: false));
        }
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<LoadRefreshReservation>((event, emit) async {
      if (event.refresh) {
        emit(state.copyWith(page: 1, isLoading: true));
      } else {
        late int page;
        page = state.pagination?.page ?? 0;
        int? lastPage = state.pagination?.lastPage ?? 1;
        page += 1;
        if (page > lastPage) return;
        emit(state.copyWith(page: page, isLoading: true));
      }
      final String params =
          this.params(state.page.toString(), state.limit.toString());
      final response = await this
          .commonZonesRepo
          .getReservations(event.context, event.id_user, params);
      if (response != null && response.statusCode == 200) {
        final reservationResponse = json.decode(response.body);
        final List<Reservations> reservations = reservationResponse['data']
            .map((e) => Reservations.fromJson(e))
            .toList()
            .cast<Reservations>();
        final Pagination? pagination =
            Pagination.fromJson(reservationResponse['page']);
        if (event.refresh) {
          emit(state.copyWith(
              reservations: reservations,
              pagination: pagination,
              isLoading: false));
        } else {
          emit(state.copyWith(
              reservations: [...reservations, ...?state.reservations],
              pagination: pagination,
              isLoading: false));
        }
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });

    on<EditReservation>((event, emit) async {
      emit(state.copyWith(reservation: event.reservation, isEditing: true));
    });

    on<ChangeLoading>((event, emit) async {
      emit(state.copyWith(isLoading: event.isLoading));
    });

    on<ChangeHour>((event, emit) async {
      emit(state.copyWith(start: event.start, end: event.end));
    });

    on<ChangeCost>((event, emit) {
      emit(state.copyWith(cost: event.cost));
    });

    on<ChangeSelectedDate>((event, emit) {
      emit(state.copyWith(selectedDate: event.selectedDate));
    });

    on<DeleteReservation>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final response =
          await this.commonZonesRepo.deleteReservation(event.context, event.id);
      if (response != null && response.statusCode == 200) {
        emit(state.copyWith(isLoading: false));
        final reservations = [
          ...?state.reservations,
        ];
        final List<Reservations> newReservations = reservations
            .where((element) => element.id != event.id)
            .toList()
            .cast<Reservations>();
        final Pagination? pagination =
            state.pagination!.rebuild((b) => b..total = (b.total! - 1).toInt());
        emit(state.copyWith(
            reservations: newReservations, pagination: pagination));
      } else {
        emit(state.copyWith(isLoading: false));
      }
    });
  }
}
