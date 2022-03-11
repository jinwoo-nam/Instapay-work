import 'package:instapay_clone/data/data_source/setting/delete_address_data_source.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/repository/setting/delete_address_repository.dart';

class DeleteAddressRepositoryImpl implements DeleteAddressRepository {
  final _dataSource = DeleteAddressDataSource();

  @override
  Future<void> deleteAddress(AddressData address) async {
    return await _dataSource.deleteAddress(address);
  }

}