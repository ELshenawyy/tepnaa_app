part of 'specialties_cubit.dart';

sealed class SpecialtiesState extends Equatable {
  const SpecialtiesState();

  @override
  List<Object> get props => [];
}

class SpecialtiesInitial extends SpecialtiesState {}

class SpecialtiesChanged extends SpecialtiesState {
  final String selectedFilter;

  @override
  List<Object> get props => [selectedFilter];

  const SpecialtiesChanged(this.selectedFilter);
}
