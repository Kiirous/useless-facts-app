import '../repositories/fact_repository.dart';
import '../entities/useless_fact.dart';

class GetRandomFactUseCase {
  final FactRepository repository;

  GetRandomFactUseCase(this.repository);

  Future<UselessFact> call() => repository.getRandomFact();
}