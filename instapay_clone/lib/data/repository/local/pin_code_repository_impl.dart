import 'package:instapay_clone/data/data_source/local/pin_code_data_source.dart';
import 'package:instapay_clone/domain/repository/local/pin_code_repository.dart';

class PinCodeRepositoryImpl implements PinCodeRepository {
  final PinCodeDataSource _dataSource = PinCodeDataSource();

  @override
  Future<String> loadPinCode() async {
    return await _dataSource.loadPinCode();
  }

  @override
  Future<void> savePinCode(String pinCode) async {
    await _dataSource.savePinCode(pinCode);
  }

  @override
  Future<void> deletePinCode() async {
    await _dataSource.deletePinCode();
  }
}
