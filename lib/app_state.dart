import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _filter = await secureStorage.getStringList('ff_filter') ?? _filter;
    });
    await _safeInitAsync(() async {
      _deletedPosts = (await secureStorage.getStringList('ff_deletedPosts'))
              ?.map((path) => path.ref)
              .toList() ??
          _deletedPosts;
    });
    await _safeInitAsync(() async {
      _walkthrough =
          await secureStorage.getBool('ff_walkthrough') ?? _walkthrough;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _filter = [
    'Has tickets, exclusive acces, or sponsorship',
    'Doesn\'t  have tickets, exclusive acces, or sponsorship',
    'Not too far',
    'fancy dress code (semi-formal + )',
    'regular dress code (busniess - )'
  ];
  List<String> get filter => _filter;
  set filter(List<String> value) {
    _filter = value;
    secureStorage.setStringList('ff_filter', value);
  }

  void deleteFilter() {
    secureStorage.delete(key: 'ff_filter');
  }

  void addToFilter(String value) {
    filter.add(value);
    secureStorage.setStringList('ff_filter', _filter);
  }

  void removeFromFilter(String value) {
    filter.remove(value);
    secureStorage.setStringList('ff_filter', _filter);
  }

  void removeAtIndexFromFilter(int index) {
    filter.removeAt(index);
    secureStorage.setStringList('ff_filter', _filter);
  }

  void updateFilterAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filter[index] = updateFn(_filter[index]);
    secureStorage.setStringList('ff_filter', _filter);
  }

  void insertAtIndexInFilter(int index, String value) {
    filter.insert(index, value);
    secureStorage.setStringList('ff_filter', _filter);
  }

  List<bool> _selectedFilter = [];
  List<bool> get selectedFilter => _selectedFilter;
  set selectedFilter(List<bool> value) {
    _selectedFilter = value;
  }

  void addToSelectedFilter(bool value) {
    selectedFilter.add(value);
  }

  void removeFromSelectedFilter(bool value) {
    selectedFilter.remove(value);
  }

  void removeAtIndexFromSelectedFilter(int index) {
    selectedFilter.removeAt(index);
  }

  void updateSelectedFilterAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    selectedFilter[index] = updateFn(_selectedFilter[index]);
  }

  void insertAtIndexInSelectedFilter(int index, bool value) {
    selectedFilter.insert(index, value);
  }

  List<String> _filtergroup1 = [];
  List<String> get filtergroup1 => _filtergroup1;
  set filtergroup1(List<String> value) {
    _filtergroup1 = value;
  }

  void addToFiltergroup1(String value) {
    filtergroup1.add(value);
  }

  void removeFromFiltergroup1(String value) {
    filtergroup1.remove(value);
  }

  void removeAtIndexFromFiltergroup1(int index) {
    filtergroup1.removeAt(index);
  }

  void updateFiltergroup1AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filtergroup1[index] = updateFn(_filtergroup1[index]);
  }

  void insertAtIndexInFiltergroup1(int index, String value) {
    filtergroup1.insert(index, value);
  }

  List<String> _filterGroup2 = [];
  List<String> get filterGroup2 => _filterGroup2;
  set filterGroup2(List<String> value) {
    _filterGroup2 = value;
  }

  void addToFilterGroup2(String value) {
    filterGroup2.add(value);
  }

  void removeFromFilterGroup2(String value) {
    filterGroup2.remove(value);
  }

  void removeAtIndexFromFilterGroup2(int index) {
    filterGroup2.removeAt(index);
  }

  void updateFilterGroup2AtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    filterGroup2[index] = updateFn(_filterGroup2[index]);
  }

  void insertAtIndexInFilterGroup2(int index, String value) {
    filterGroup2.insert(index, value);
  }

  List<Exclusivity> _FilterExclu = [];
  List<Exclusivity> get FilterExclu => _FilterExclu;
  set FilterExclu(List<Exclusivity> value) {
    _FilterExclu = value;
  }

  void addToFilterExclu(Exclusivity value) {
    FilterExclu.add(value);
  }

  void removeFromFilterExclu(Exclusivity value) {
    FilterExclu.remove(value);
  }

  void removeAtIndexFromFilterExclu(int index) {
    FilterExclu.removeAt(index);
  }

  void updateFilterExcluAtIndex(
    int index,
    Exclusivity Function(Exclusivity) updateFn,
  ) {
    FilterExclu[index] = updateFn(_FilterExclu[index]);
  }

  void insertAtIndexInFilterExclu(int index, Exclusivity value) {
    FilterExclu.insert(index, value);
  }

  List<Exclusivity> _listenu = [];
  List<Exclusivity> get listenu => _listenu;
  set listenu(List<Exclusivity> value) {
    _listenu = value;
  }

  void addToListenu(Exclusivity value) {
    listenu.add(value);
  }

  void removeFromListenu(Exclusivity value) {
    listenu.remove(value);
  }

  void removeAtIndexFromListenu(int index) {
    listenu.removeAt(index);
  }

  void updateListenuAtIndex(
    int index,
    Exclusivity Function(Exclusivity) updateFn,
  ) {
    listenu[index] = updateFn(_listenu[index]);
  }

  void insertAtIndexInListenu(int index, Exclusivity value) {
    listenu.insert(index, value);
  }

  List<DocumentReference> _deletedPosts = [];
  List<DocumentReference> get deletedPosts => _deletedPosts;
  set deletedPosts(List<DocumentReference> value) {
    _deletedPosts = value;
    secureStorage.setStringList(
        'ff_deletedPosts', value.map((x) => x.path).toList());
  }

  void deleteDeletedPosts() {
    secureStorage.delete(key: 'ff_deletedPosts');
  }

  void addToDeletedPosts(DocumentReference value) {
    deletedPosts.add(value);
    secureStorage.setStringList(
        'ff_deletedPosts', _deletedPosts.map((x) => x.path).toList());
  }

  void removeFromDeletedPosts(DocumentReference value) {
    deletedPosts.remove(value);
    secureStorage.setStringList(
        'ff_deletedPosts', _deletedPosts.map((x) => x.path).toList());
  }

  void removeAtIndexFromDeletedPosts(int index) {
    deletedPosts.removeAt(index);
    secureStorage.setStringList(
        'ff_deletedPosts', _deletedPosts.map((x) => x.path).toList());
  }

  void updateDeletedPostsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    deletedPosts[index] = updateFn(_deletedPosts[index]);
    secureStorage.setStringList(
        'ff_deletedPosts', _deletedPosts.map((x) => x.path).toList());
  }

  void insertAtIndexInDeletedPosts(int index, DocumentReference value) {
    deletedPosts.insert(index, value);
    secureStorage.setStringList(
        'ff_deletedPosts', _deletedPosts.map((x) => x.path).toList());
  }

  bool _walkthrough = false;
  bool get walkthrough => _walkthrough;
  set walkthrough(bool value) {
    _walkthrough = value;
    secureStorage.setBool('ff_walkthrough', value);
  }

  void deleteWalkthrough() {
    secureStorage.delete(key: 'ff_walkthrough');
  }

  final _userDocQueryManager = FutureRequestManager<UserRecord>();
  Future<UserRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UserRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
