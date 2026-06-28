part of 'distination_cubit.dart';

sealed class DistinationState extends Equatable {
  const DistinationState();

  @override
  List<Object> get props => [];
}

final class DistinationInitial extends DistinationState {}

final class DistinationLoading extends DistinationState {}

final class DistinationSuccess extends DistinationState {
  final List<SpecialtyModel> specialties;
  final String selectKey;

  const DistinationSuccess(
      {required this.specialties, required this.selectKey});

  @override
  List<Object> get props => [specialties,selectKey];
}

final class DistinationFailure extends DistinationState {
  final String errorMessage;

  const DistinationFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
