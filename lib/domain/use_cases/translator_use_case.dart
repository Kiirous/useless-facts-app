import 'package:translator/translator.dart';

class TranslatorUseCase {
  final GoogleTranslator translator;

  TranslatorUseCase(this.translator);

  Future<String> call(String fact) async {
    try {
      final translatedText = await translator.translate(fact, to: 'pt');

      return translatedText.text;
    } catch (_) {
      return fact;
    }
  }
}
