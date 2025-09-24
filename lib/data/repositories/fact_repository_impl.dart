import '../../domain/entities/useless_fact.dart';
import '../data_sources/fact_remote_data_source.dart';
import '../../domain/repositories/fact_repository.dart';

class FactRepositoryImpl implements FactRepository {
  final FactRemoteDataSource dataSource;

  FactRepositoryImpl(this.dataSource);

  @override
  Future<UselessFact> getRandomFact() {
    return dataSource.getRandomFact();
  }
}