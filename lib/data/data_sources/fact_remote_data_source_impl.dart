import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/useless_fact_model.dart';
import 'fact_remote_data_source.dart';

class FactRemoteDataSourceImpl implements FactRemoteDataSource {
  final http.Client client;

  FactRemoteDataSourceImpl(this.client);

  @override
  Future<UselessFactModel> getRandomFact() async {
    final response = await client.get(Uri.parse('https://uselessfacts.jsph.pl/random.json?language=en'));
    final jsonMap = json.decode(response.body);
    return UselessFactModel.fromJson(jsonMap);
  }
}