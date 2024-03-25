part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}


class LoadingGetSearchState extends SearchState {}

class SuccessGetSearchState extends SearchState {}

class ErrorGetSearchState extends SearchState {}
