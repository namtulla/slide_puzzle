import 'app_state.dart';
import 'flutter.dart';
import 'shared_theme.dart';

class ThemeSimple extends SharedTheme {
  @override
  String get name => 'Simple';

  ThemeSimple(AppState proxy) : super(proxy);

  @override
  Color get puzzleThemeBackground => const Color.fromARGB(255, 54, 81, 102);

  @override
  Color get puzzleBackgroundColor => Colors.white70;

  @override
  RoundedRectangleBorder get puzzleBorder => const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black38, width: 2),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      );

  @override
  Widget tileButton(int i) {
    if (i == puzzle.tileCount) {
      assert(puzzle.solved);
      return const Center(
        child: Icon(
          Icons.thumb_up,
          size: 72,
          color: Colors.black,
        ),
      );
    }

    final correctPosition = puzzle.isCorrectPosition(i);

    final content = createInk(
      Center(
        child: Text(
          (i + 1).toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: correctPosition ? FontWeight.bold : FontWeight.normal,
            fontSize: 42,
          ),
        ),
      ),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.white, Color(0xffcccccc)],
        tileMode: TileMode.clamp, // repeats the gradient over the canvas
      ),
    );

    return createButton(i, content);
  }
}
