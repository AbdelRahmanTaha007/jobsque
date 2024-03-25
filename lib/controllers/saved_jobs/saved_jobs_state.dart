part of 'saved_jobs_cubit.dart';

@immutable
sealed class SavedJobsState {}

final class SavedJobsInitial extends SavedJobsState {}

class LoadingGetSavedJobsState extends SavedJobsState {}

class SuccessGetSavedJobsState extends SavedJobsState {}

class ErrorGetSavedJobsState extends SavedJobsState {}

class SuccessSavinJobToFavouritesState extends SavedJobsState {}

class ErrorSavinJobToFavourites extends SavedJobsState {}

