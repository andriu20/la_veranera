// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

class HomeState extends Equatable {
  final BuildContext context;
  late bool loading;

  final List<DatumMEntity>? mesas;
  HomeState({
    required this.context,
    this.loading = false,
    this.mesas ,
  });

  @override
  List<Object?> get props => [context, loading, mesas];

  HomeState copyWith({
    BuildContext? context,
    bool? loading,
    List<DatumMEntity>? mesas,
  }) => HomeState(
    context: context ?? this.context,
    loading: loading ?? this.loading,
    mesas: mesas ?? this.mesas,
  );
}
