part of 'add_plate_cubit.dart';

// ignore: must_be_immutable
class AddPlateState extends Equatable {
  final BuildContext context;

  late bool formValid;

  AddPlateState({required this.context, this.formValid = false});

  @override
  List<Object> get props => [context, formValid];

  AddPlateState copwyWith({BuildContext? context, bool? formValid}) {
    return AddPlateState(
      context: context ?? this.context,
      formValid: formValid ?? this.formValid,
    );
  }
}
