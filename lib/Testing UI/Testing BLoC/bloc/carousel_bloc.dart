import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselChangedState(index: 0)) {
    on<ChangeCoursel>((event, emit) {
      emit(CarouselChangedState(index: event.index));
    });
  }
}
