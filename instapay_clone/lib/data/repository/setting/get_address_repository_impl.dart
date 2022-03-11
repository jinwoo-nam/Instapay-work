import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/setting/get_address_list_data_source.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/repository/setting/get_address_repository.dart';

class GetAddressRepositoryImpl implements GetAddressRepository {
  final _dataSource = GetAddressListDataSource();

  @override
  Future<Result<List<AddressData>>> getAddressData() async {
    return await _dataSource.getAddressList();
  }

}