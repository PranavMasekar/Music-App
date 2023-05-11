import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  const Failure({this.properties = const []});

  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure {
  const ServerFailure();
}

class CacheFailure extends Failure {
  const CacheFailure();
}
