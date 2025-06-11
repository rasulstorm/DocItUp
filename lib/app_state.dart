import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
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
      _CartCounter =
          await secureStorage.getInt('ff_CartCounter') ?? _CartCounter;
    });
    await _safeInitAsync(() async {
      _Confirm = await secureStorage.getBool('ff_Confirm') ?? _Confirm;
    });
    await _safeInitAsync(() async {
      _CurrentPage =
          await secureStorage.getString('ff_CurrentPage') ?? _CurrentPage;
    });
    await _safeInitAsync(() async {
      _truer = await secureStorage.getBool('ff_truer') ?? _truer;
    });
    await _safeInitAsync(() async {
      _Currentpage =
          await secureStorage.getString('ff_Currentpage') ?? _Currentpage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _CartCounter = 0;
  int get CartCounter => _CartCounter;
  set CartCounter(int value) {
    _CartCounter = value;
    secureStorage.setInt('ff_CartCounter', value);
  }

  void deleteCartCounter() {
    secureStorage.delete(key: 'ff_CartCounter');
  }

  double _cartTotal = 0.0;
  double get cartTotal => _cartTotal;
  set cartTotal(double value) {
    _cartTotal = value;
  }

  List<DocumentReference> _fav = [];
  List<DocumentReference> get fav => _fav;
  set fav(List<DocumentReference> value) {
    _fav = value;
  }

  void addToFav(DocumentReference value) {
    fav.add(value);
  }

  void removeFromFav(DocumentReference value) {
    fav.remove(value);
  }

  void removeAtIndexFromFav(int index) {
    fav.removeAt(index);
  }

  void updateFavAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    fav[index] = updateFn(_fav[index]);
  }

  void insertAtIndexInFav(int index, DocumentReference value) {
    fav.insert(index, value);
  }

  List<String> _Product = [];
  List<String> get Product => _Product;
  set Product(List<String> value) {
    _Product = value;
  }

  void addToProduct(String value) {
    Product.add(value);
  }

  void removeFromProduct(String value) {
    Product.remove(value);
  }

  void removeAtIndexFromProduct(int index) {
    Product.removeAt(index);
  }

  void updateProductAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Product[index] = updateFn(_Product[index]);
  }

  void insertAtIndexInProduct(int index, String value) {
    Product.insert(index, value);
  }

  List<String> _Products = [];
  List<String> get Products => _Products;
  set Products(List<String> value) {
    _Products = value;
  }

  void addToProducts(String value) {
    Products.add(value);
  }

  void removeFromProducts(String value) {
    Products.remove(value);
  }

  void removeAtIndexFromProducts(int index) {
    Products.removeAt(index);
  }

  void updateProductsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Products[index] = updateFn(_Products[index]);
  }

  void insertAtIndexInProducts(int index, String value) {
    Products.insert(index, value);
  }

  bool _Confirm = true;
  bool get Confirm => _Confirm;
  set Confirm(bool value) {
    _Confirm = value;
    secureStorage.setBool('ff_Confirm', value);
  }

  void deleteConfirm() {
    secureStorage.delete(key: 'ff_Confirm');
  }

  String _CurrentPage = 'home';
  String get CurrentPage => _CurrentPage;
  set CurrentPage(String value) {
    _CurrentPage = value;
    secureStorage.setString('ff_CurrentPage', value);
  }

  void deleteCurrentPage() {
    secureStorage.delete(key: 'ff_CurrentPage');
  }

  bool _truer = false;
  bool get truer => _truer;
  set truer(bool value) {
    _truer = value;
    secureStorage.setBool('ff_truer', value);
  }

  void deleteTruer() {
    secureStorage.delete(key: 'ff_truer');
  }

  List<CartItemStruct> _Cart = [];
  List<CartItemStruct> get Cart => _Cart;
  set Cart(List<CartItemStruct> value) {
    _Cart = value;
  }

  void addToCart(CartItemStruct value) {
    Cart.add(value);
  }

  void removeFromCart(CartItemStruct value) {
    Cart.remove(value);
  }

  void removeAtIndexFromCart(int index) {
    Cart.removeAt(index);
  }

  void updateCartAtIndex(
    int index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    Cart[index] = updateFn(_Cart[index]);
  }

  void insertAtIndexInCart(int index, CartItemStruct value) {
    Cart.insert(index, value);
  }

  String _Currentpage = '';
  String get Currentpage => _Currentpage;
  set Currentpage(String value) {
    _Currentpage = value;
    secureStorage.setString('ff_Currentpage', value);
  }

  void deleteCurrentpage() {
    secureStorage.delete(key: 'ff_Currentpage');
  }
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
