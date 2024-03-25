part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

class FailedLoginState extends LoginCubitState {}

class SuccessLoginState extends LoginCubitState {}