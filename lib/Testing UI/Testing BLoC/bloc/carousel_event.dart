part of 'carousel_bloc.dart';

abstract class CarouselEvent extends Equatable {
  const CarouselEvent();

  @override
  List<Object> get props => [];
}

class ChangeCoursel extends CarouselEvent {
  final int index;
  ChangeCoursel({required this.index});
}
