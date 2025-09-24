import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fact_provider.dart';
import '../widgets/fact_preview.dart';
import '../widgets/theme_toggle_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  String? _lastFactId;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final factAsync = ref.watch(factProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Fatos Inúteis'),
        centerTitle: true,
        actions: [
          ThemeToggleButton(),
        ],
      ),
      body: factAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
        data: (fact) {
          if (fact.id != _lastFactId) {
            _lastFactId = fact.id;
            _controller.reset();
            _controller.forward();
          }

          return FadeTransition(
            opacity: _fadeAnimation,
            child: FactPreview(fact: fact),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.refresh(factProvider),
        child: Icon(Icons.refresh),
      ),
    );
  }
}
