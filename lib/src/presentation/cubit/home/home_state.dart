part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BuildContext context;
  HomeState({required this.context});

  @override
  List<Object> get props => [context];

  HomeState copyWith({BuildContext? context}) =>
      HomeState(context: context ?? this.context);
}
