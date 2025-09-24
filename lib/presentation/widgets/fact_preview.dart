import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/useless_fact.dart';

class FactPreview extends StatelessWidget {
  const FactPreview({super.key, required this.fact});

  final UselessFact fact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Fato', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text(
              fact.text!,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: 'Fonte: ',
                children: <TextSpan>[
                  TextSpan(
                    text: fact.source!,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decorationColor: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final uri = Uri.parse(fact.sourceUrl!);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          throw 'Não foi possível abrir o link';
                        }
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
