import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen/features/home/data/model/specialty_model.dart';
import 'package:login_screen/features/home/data/repositories/distinations_repo.dart';
part 'distination_state.dart';

class DistinationCubit extends Cubit<DistinationState> {
    final DistinationRepository _repository;

  DistinationCubit(this._repository) : super(DistinationInitial());



  Future <void> getSpecialties() async{
    emit(DistinationLoading());
    try {
      final specialties = await _repository.getDistinations();
      emit(DistinationSuccess(specialties: specialties, selectKey: specialties.first.key));
    } catch (e) {
      emit(DistinationFailure(errorMessage: e.toString()));
    }
  }

  void selectSpicialty(String key) {
    final state = this.state;
    if (state is DistinationSuccess) {
      emit(DistinationSuccess(specialties: state.specialties, selectKey: key));
    }
  }
}
