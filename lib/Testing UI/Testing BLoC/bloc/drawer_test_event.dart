part of 'drawer_test_bloc.dart';

abstract class DrawerTestEvent extends Equatable {
  const DrawerTestEvent();

  @override
  List<Object> get props => [];
}

class OpenDrawerEvent extends DrawerTestEvent {}

class CloseDrawerEvent extends DrawerTestEvent {}
