import '../models/useless_fact_model.dart';

abstract class FactRemoteDataSource {
  Future<UselessFactModel> getRandomFact();
}
