import 'package:dart_state/player.dart';

void main(List<String> arguments) {
  print('Hello world!');

  final m = MusicPlayer('alternative');
  // 1. Play, Pause, Play
  m.Play();
  m.Pause();
  m.Play();

  // 2. Pause, Next Play
  m.Pause();
  m.Next();
  m.Play();

  // 3. Random: Pause, Play, Next
  m.ToggleShuffle();
  m.Pause();
  m.Play();
  m.Next();

  // 4. Disable Random
  m.ToggleShuffle();
  m.Play();
  m.Next();
  m.Pause();
  m.Next();
  m.Play();
}
