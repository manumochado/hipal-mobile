part of 'sos_bloc.dart';

@immutable
class SosState {
  final bool isInitSocket;
  final bool isEmergency;
  final bool statusLoaded;
  final Chat? chat;
  final String? phoneWatchman;

  const SosState({
    this.isInitSocket = false,
    this.isEmergency = false,
    this.statusLoaded = false,
    this.chat,
    this.phoneWatchman,
  });

  SosState copyWith({
    bool? isInitSocket,
    bool? isEmergency,
    bool? statusLoaded,
    Chat? chat,
    String? phoneWatchman,
  }) => SosState(
    isInitSocket: isInitSocket ?? this.isInitSocket,
    isEmergency: isEmergency ?? this.isEmergency,
    statusLoaded: statusLoaded ?? this.statusLoaded,
    chat: chat ?? this.chat,
    phoneWatchman: phoneWatchman ?? this.phoneWatchman,
  );
}

class SosInitial extends SosState {}
