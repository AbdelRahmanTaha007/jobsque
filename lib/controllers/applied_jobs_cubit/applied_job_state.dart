part of 'applied_job_cubit.dart';

@immutable
sealed class AppliedJobState {}

final class AppliedJobInitial extends AppliedJobState {}
final class SuccessGetAppliedJobsState extends AppliedJobState {}
final class LoadingGetAppliedJobsState extends AppliedJobState {}
final class FailedGetAppliedJobsState extends AppliedJobState {}

