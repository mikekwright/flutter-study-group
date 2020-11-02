import 'dart:math';

abstract class PlayerState {
  PlayerState Next();
  PlayerState Play();
  PlayerState Pause();
  PlayerState ToggleShuffle();
}

abstract class _PlayState implements PlayerState {
  var _songList = [];
  var _currentIndex = 0;

  _PlayState(List<String> songs, {int songIndex = 0}) {
    _songList = songs;
    _currentIndex = songIndex;
  }
}

class PlaylistPlayState extends _PlayState {
  PlaylistPlayState(List<String> songs, {int songIndex = 0})
      : super(songs, songIndex: songIndex);

  @override
  PlayerState Next() {
    _currentIndex = (_currentIndex + 1) % _songList.length;
    print('Playing next song: ${_songList[_currentIndex]}');
    return this;
  }

  @override
  PlayerState Pause() {
    print('Pausing on song: ${_songList[_currentIndex]}');
    return _PlaylistPauseState(_songList, _currentIndex);
  }

  @override
  PlayerState Play() {
    print('Already playing song: ${_songList[_currentIndex]}');
    return this;
  }

  @override
  PlayerState ToggleShuffle() {
    print('Enable random');
    return _RandomPlayState(_songList, _currentIndex);
  }
}

class _PlaylistPauseState extends _PlayState {
  _PlaylistPauseState(List<String> songs, int songIndex)
      : super(songs, songIndex: songIndex);

  @override
  PlayerState Next() {
    _currentIndex = (_currentIndex + 1) % _songList.length;
    print('Prepping next song: ${_songList[_currentIndex]}');
    return this;
  }

  @override
  PlayerState Pause() {
    print('Already paused on song: ${_songList[_currentIndex]}');
    return this;
  }

  @override
  PlayerState Play() {
    print('Starting to play song: ${_songList[_currentIndex]}');
    return PlaylistPlayState(_songList, songIndex: _currentIndex);
  }

  @override
  PlayerState ToggleShuffle() {
    print('Enabling shuffle');
    return _RandomPauseState(_songList, _currentIndex);
  }
}

class _RandomPlayState extends _PlayState {
  final _random = Random();

  _RandomPlayState(List<String> songs, int songIndex)
      : super(songs, songIndex: songIndex);

  @override
  PlayerState Next() {
    _currentIndex = _random.nextInt(_songList.length);
    print('Playing random song: ${_songList[_currentIndex]}');
    return this;
  }

  @override
  PlayerState Pause() {
    print('Pausing shuffle list on song: ${_songList[_currentIndex]}');
    return _RandomPauseState(_songList, _currentIndex);
  }

  @override
  PlayerState Play() {
    print('Continuing play on shuffle: ${_songList[_currentIndex]}');
    return this;
  }

  @override
  PlayerState ToggleShuffle() {
    print('Disabling shuffle');
    return PlaylistPlayState(_songList, songIndex: _currentIndex);
  }
}

class _RandomPauseState extends _PlayState {
  final _random = Random();

  _RandomPauseState(List<String> songs, int songIndex)
      : super(songs, songIndex: songIndex);

  @override
  PlayerState Next() {
    _currentIndex = _random.nextInt(_songList.length);
    print('Ready for next random song: ${_songList[_currentIndex]}');
    return this;
  }

  @override
  PlayerState Pause() {
    print('Already paused on shuffle: ${_songList[_currentIndex]}');
    return this;
  }

  @override
  PlayerState Play() {
    print('Starting play on song: ${_songList[_currentIndex]}');
    return _RandomPlayState(_songList, _currentIndex);
  }

  @override
  PlayerState ToggleShuffle() {
    print('Disabling shuffle from paused state');
    return _PlaylistPauseState(_songList, _currentIndex);
  }
}
