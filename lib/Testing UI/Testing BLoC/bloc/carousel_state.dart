part of 'carousel_bloc.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();

  @override
  List<Object> get props => [];
}

class CarouselChangedState extends CarouselState {
  final int index;
  CarouselChangedState({required this.index});
  @override
  List<Object> get props => [index];
}
