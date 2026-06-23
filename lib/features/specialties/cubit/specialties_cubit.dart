import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'specialties_state.dart';

class SpecialtiesCubit extends Cubit<SpecialtiesState> {
  SpecialtiesCubit() : super(SpecialtiesChanged('التخصصات'));

  String selectedFilter = 'التخصصات';
  void changeFilter(String filter) {
    selectedFilter = filter;
    emit(SpecialtiesChanged(filter));
  }
}
