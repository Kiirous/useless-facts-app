import 'package:riverpod/riverpod.dart';
import 'package:translator/translator.dart';

import '../../core/di/di.dart';
import '../../domain/entities/useless_fact.dart';
import '../../domain/use_cases/get_random_fact_use_case.dart';

final factProvider = FutureProvider<UselessFact>((ref) async {
  final getRandomFactUseCase = getIt<GetRandomFactUseCase>();
  final translator = getIt<GoogleTranslator>();

  final fact = await getRandomFactUseCase();

  final translatedText = await translator.translate(fact.text!, to: 'pt');

  return fact.copyWith(text: translatedText.text);
});