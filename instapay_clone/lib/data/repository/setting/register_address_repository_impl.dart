import 'package:instapay_clone/data/data_source/setting/register_address_data_source.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/repository/setting/register_address_repository.dart';

class RegisterAddressRepositoryImpl implements RegisterAddressRepository {
  final _dataSource = RegisterAddressDataSource();

  @override
  Future<void> registerAddress(AddressData address) async {
    await _dataSource.registerAddress(address);
  }

  @override
  Future<void> setDefaultAddress(AddressData? address) async {
    await _dataSource.setDefaultAddress(address);
  }

}