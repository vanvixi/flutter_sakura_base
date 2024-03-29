part of widget_utils;

/// use it:
///
/// ```
/// LazyFutureBuilder(
///   future: () async {
///     await Future.delayed(const Duration(seconds: 2));
///   },
///   builder: (context, futureBuilder, isFutureBuilding) => Button(
///     onPressed: futureBuilder,
///     child: Text(
///       isFutureBuilding ? "Loading" : "Submit",
///     ),
///   ),
/// ),
/// ```

typedef FutureWidgetBuilder = Widget Function(
  BuildContext context,
  Future Function() future,
  bool isFutureExecuting,
);

class LazyFutureBuilder extends HookConsumerWidget {
  const LazyFutureBuilder({
    Key? key,
    required this.lazyFuture,
    required this.builder,
  }) : super(key: key);

  final Future Function() lazyFuture;
  final FutureWidgetBuilder builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFutureExecutingNotifier = useState<bool>(false);

    return ValueListenableBuilder<bool>(
      valueListenable: isFutureExecutingNotifier,
      builder: (context, isFutureExecuting, child) {
        return builder(
          context,
          () async {
            await execute(isFutureExecutingNotifier);
          },
          isFutureExecuting,
        );
      },
    );
  }

  Future execute(ValueNotifier<bool> isFutureExecutingNotifier) async {
    if (isFutureExecutingNotifier.value) {
      return;
    }

    try {
      isFutureExecutingNotifier.value = true;
      await lazyFuture();
    } finally {
      isFutureExecutingNotifier.value = false;
    }
  }
}
