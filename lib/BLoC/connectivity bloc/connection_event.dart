part of 'connection_bloc.dart';

// @immutable
// abstract class NetworkEvent {}

// class ListenConnection extends NetworkEvent {}

// class ConnectionChanged extends NetworkEvent {
//   NetworkState connection;
//   ConnectionChanged(this.connection);
// }

@immutable
abstract class NetworkEvent {}

class OnConnectedEvent extends NetworkEvent {}

class OnNotConnectedEvent extends NetworkEvent {}
