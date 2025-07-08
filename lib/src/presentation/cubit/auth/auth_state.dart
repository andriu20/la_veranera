part of 'auth_cubit.dart';

// ignore: must_be_immutable
class AuthState extends Equatable {
  final BuildContext context;

  late bool obscureText;

  late bool formValid;

  AuthState({
    required this.context,
    this.obscureText = true,
    this.formValid = false,
  });

  @override
  List<Object?> get props => [obscureText, context, formValid];

  AuthState copyWith({
    BuildContext? context,
    bool? obscureText,
    bool? formValid,
  }) => AuthState(
    context: context ?? this.context,
    obscureText: obscureText ?? this.obscureText,
    formValid: formValid ?? this.formValid,
  );
}
