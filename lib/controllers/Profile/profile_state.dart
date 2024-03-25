part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}


class LoadingGetProfileState extends ProfileState {}

class SuccessGetProfileState extends ProfileState {}

class ErrorGetProfileState extends ProfileState {}
