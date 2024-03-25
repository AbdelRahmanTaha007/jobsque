part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}


class SuccessSignupState extends SignupState {}

class FailedSignupState extends SignupState {}