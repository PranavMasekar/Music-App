part of 'drawer_test_bloc.dart';

abstract class DrawerTestState extends Equatable {
  const DrawerTestState();

  @override
  List<Object> get props => [];
}

class DrawerOpened extends DrawerTestState {}

class DrawerClosed extends DrawerTestState {}
