part of 'portfolios_cubit.dart';

@immutable
sealed class PortfoliosState {}

final class PortfoliosInitial extends PortfoliosState {}


final class LoadingGetPortfoliosState extends PortfoliosState {}
final class SuccessGetPortfoliosState extends PortfoliosState {}
final class FailedGetPortfoliosState extends PortfoliosState {}

final class SuccessUploadPortfoliosState extends PortfoliosState {}
final class FailedUploadPortfoliosState extends PortfoliosState {}

