import '../global.dart';

class HistoryManager {
  HistoryManager() {
    _searchHistory =
        Global.prefs.getStringList(Global.searchHistoryKey) ?? <String>[];
  }

  List<String> _searchHistory;
  List<String> get searchHistory => _searchHistory;

  Future<bool> updateSearchHistory() async {
    return await _saveSearchHistory();
  }

  Future<bool> newSearch(String keyWord) async {
    _searchHistory.add(keyWord);
    return await _saveSearchHistory();
  }

  Future<bool> clearHistory() async {
    _searchHistory.clear();
    return await _saveSearchHistory();
  }

  Future<bool> _saveSearchHistory() =>
      Global.prefs.setStringList(Global.searchHistoryKey, _searchHistory);
}
