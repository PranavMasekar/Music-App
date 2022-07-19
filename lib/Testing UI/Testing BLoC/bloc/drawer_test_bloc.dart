import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_test_event.dart';
part 'drawer_test_state.dart';

class DrawerTestBloc extends Bloc<DrawerTestEvent, DrawerTestState> {
  DrawerTestBloc() : super(DrawerClosed()) {
    on<DrawerTestEvent>((event, emit) {
      if (event is OpenDrawerEvent)
        emit(DrawerOpened());
      else
        emit(DrawerClosed());
    });
  }
}
