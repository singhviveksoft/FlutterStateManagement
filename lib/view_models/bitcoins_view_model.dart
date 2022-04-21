import 'package:flutter/widgets.dart';
import 'package:state_mangement_provider/model/Bitcoin.dart';
import 'package:state_mangement_provider/repo/api_services.dart';
import 'package:state_mangement_provider/utils/status.dart';

class BitcoinModelView with ChangeNotifier {
  bool _loading = false;
  List<Bitcoin> _bitcoinListModel = [];
  String _error = '';

  bool get loading => _loading;

  List<Bitcoin> get bitcoinListModel => _bitcoinListModel;

  String get error => _error;

  BitcoinModelView() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<Bitcoin> bitcoinListModel) {
    _bitcoinListModel = bitcoinListModel;
  }

  setUserError(String error) {
    _error = error;
  }

  getUsers() async {
    setLoading(true);
    var response = await ApiServices.getBitcoin();
    if (response.isNotEmpty) {
      setUserListModel(response);
    }
    if (response.isEmpty) {
      setUserError('No Data Found');
    }
    setLoading(false);
  }
}
