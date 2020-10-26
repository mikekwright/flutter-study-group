import 'dart:math';

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

  final _random = Random();

  var _currentSongs = [];
  var _songIndex = 0;
  var _shuffleOn = false;
  var _paused = false;

  MusicPlayer(String playlist) {
    if (!_playlists.containsKey(playlist)) {
      print('Playlist ($playlist) was not found');
      throw Exception('Playlist missing');
    } else {
      print('Loaded playlist: $playlist');
      _currentSongs = _playlists[playlist];
      _songIndex = 0;
      _paused = true;
    }
  }

  void Next() {
    if (_shuffleOn) {
      _songIndex = _random.nextInt(_currentSongs.length);
    } else {
      _songIndex = (_songIndex + 1) % _currentSongs.length;
    }

    if (_paused) {
      print('Setup next song: ${_currentSongs[_songIndex]}');
    } else {
      print('Playing next song: ${_currentSongs[_songIndex]}');
    }
  }

  void Play() {
    if (_paused) {
      _paused = false;
      print('Continuing song: ${_currentSongs[_songIndex]}');
    } else {
      print('Already playing song: ${_currentSongs[_songIndex]}');
    }
  }

  void Pause() {
    print('Pausing on song: ${_currentSongs[_songIndex]}');
    _paused = true;
  }

  void ToggleShuffle() {
    if (_shuffleOn) {
      _shuffleOn = false;
      print('Turning off shuffle');
    } else {
      _shuffleOn = true;
      print('Turning on shuffle');
    }

    Next();
  }
}
