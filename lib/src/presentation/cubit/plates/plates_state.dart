part of 'plates_cubit.dart';

class PlatesState extends Equatable {
  final BuildContext context;
  const PlatesState({required this.context,});

  @override
  List<Object?> get props => [context, ];

  PlatesState copyWith({BuildContext? context,}) =>
      PlatesState(
        context: context ?? this.context,
      );
}
