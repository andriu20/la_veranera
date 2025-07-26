part of 'venta_cubit.dart';

class VentaState extends Equatable {
  final BuildContext context;
  final List<DatumEntity>? platos;
  final List<DatumEntity>? platosSeleccionados;
  VentaState({required this.context, this.platos, this.platosSeleccionados});

  @override
  List<Object?> get props => [context, platos, platosSeleccionados];

  VentaState copyWith({
    BuildContext? context,
    List<DatumEntity>? platos,
    List<DatumEntity>? platosSeleccionados,
  }) => VentaState(
    context: context ?? this.context,
    platos: platos ?? this.platos,
    platosSeleccionados: platosSeleccionados ?? this.platosSeleccionados,
  );
}
