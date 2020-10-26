import 'package:dart_state/player_state.dart';

class MusicPlayer {
  static final _playlists = {
    'classical': [
      'J.S. Bach: Suite No. 1 in G major',
      'Ludwig van Beethoven: Symphony No. 5 in C Minor, Op. 67',
      "Franz Schubert: 'Du bist die Ruh,' D. 776",
      'Johannes Brahms: Piano Quartet No. 1, Op. 25',
      'Frédéric Chopin: Nocturne in B-flat minor, Op. 9, No. 1',
      'Georges Bizet: Carmen',
      'Richard Strauss: Also Sprach Zarathustra, Op. 30',
      'Sergei Rachmaninoff: Piano Concerto No. 2 in C minor, Op. 18',
      'Aaron Copland: Appalachian Spring',
      'Ann Southam: Glass Houses'
    ],
    'alternative': [
      'Foo Fighters: Everlong',
      'Radiohead: Creep',
      'Bush: Glycerine',
      'Red Hot Chili Peppers: Under the Bridge',
      'Green Day: When I Come Around',
      'Third Eye Blind: Semi-Charmed Life',
      'The Offspring: Self-Esteem',
      'Pearl Jam: Alive',
      'Pearl Jam: Even Flow',
      'Live: Lightning Crashes',
      'Pearl Jam: Black',
      "Weezer: Say It Ain't So",
      'Weezer: Undone',
      'Weezer: My Name is Jonas'
    ]
  };

  PlayerState _currentState;

  MusicPlayer(String playlist) {
    if (!_playlists.containsKey(playlist)) {
      print('Playlist ($playlist) was not found');
      throw Exception('Playlist missing');
    } else {
      print('Loaded playlist: $playlist');
      _currentState = PlaylistPlayState(_playlists[playlist]);
    }
  }

  void Next() {
    _currentState = _currentState.Next();
  }

  void Play() {
    _currentState = _currentState.Play();
  }

  void Pause() {
    _currentState = _currentState.Pause();
  }

  void ToggleShuffle() {
    _currentState = _currentState.ToggleShuffle();
  }
}
