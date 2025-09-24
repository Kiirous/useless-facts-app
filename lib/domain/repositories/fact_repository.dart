import '../entities/useless_fact.dart';

abstract class FactRepository {
  Future<UselessFact> getRandomFact();
}