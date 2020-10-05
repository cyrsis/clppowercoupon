extension IterableExt<T> on Iterable<T> {
  bool containsAll(Iterable<T> list) {
    for (final item in list) {
      if (!contains(item)) return false;
    }
    return true;
  }

  T findOrNull(bool Function(T) where) => firstWhere(where, orElse: () => null);
}


//final filtered = _currentChallenges
//    .where((it) => it.categories.containsAll(filters));

//final workout = _currentWorkouts.findOrNull((it) => it.id == workoutId);
