part of 'update_password_cubit.dart';

@immutable
sealed class UpdatePasswordState {}

final class UpdatePasswordInitial extends UpdatePasswordState {}


final class SuccessUpdatePassword extends UpdatePasswordState {}
final class FailedUpdatePassword extends UpdatePasswordState {}
