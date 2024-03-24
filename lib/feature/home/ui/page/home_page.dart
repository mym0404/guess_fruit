import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../export.dart';

part 'home_page.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  void increase() {
    state++;
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.s.homeTitle),
      ),
      body: Full(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Gap(12),
              Assets.images.logo.image(width: 128, height: 128),
              const Gap(48),
              Text(
                context.s.homeBody,
                textAlign: TextAlign.center,
                style: TS.labelLarge.medium,
              ),
              const Gap(24),
              FilledButton.tonal(
                onPressed: () {
                  context.go('/detail');
                },
                child: Text(context.s.homeNavigateDetailButton),
              ),
              const Gap(48),
              Text(ref.watch(counterProvider).toString()),
              const Gap(12),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).increase();
                },
                child: const Text('+'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
