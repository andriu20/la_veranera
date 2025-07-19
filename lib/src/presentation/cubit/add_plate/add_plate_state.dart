part of 'add_plate_cubit.dart';

// ignore: must_be_immutable
class AddPlateState extends Equatable {
  final BuildContext context;

  late bool formValid;
  late bool loading;

  AddPlateState({
    required this.context,
    this.formValid = false,
    this.loading = false,
  });

  @override
  List<Object> get props => [context, formValid, loading];

  AddPlateState copwyWith({
    BuildContext? context,
    bool? formValid,
    bool? loading,
  }) {
    return AddPlateState(
      context: context ?? this.context,
      formValid: formValid ?? this.formValid,
      loading: loading ?? this.loading,
    );
  }
}
