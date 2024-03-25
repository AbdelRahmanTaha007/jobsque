part of 'jobs_cubit.dart';

@immutable
sealed class JobsState {}

final class JobsInitial extends JobsState {}

class LoadingGetJobsState extends JobsState {}

class SuccessGetJobsState extends JobsState {}

class ErrorGetJobsState extends JobsState {}

