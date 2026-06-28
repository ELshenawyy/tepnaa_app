import '../model/specialty_model.dart';

abstract class DistinationRepository {
  Future<List<SpecialtyModel>> getDistinations();
} 