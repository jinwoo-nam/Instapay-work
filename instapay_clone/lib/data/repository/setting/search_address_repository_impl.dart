import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/setting/search_address_data_source.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/repository/setting/search_address_repository.dart';

class SearchAddressRepositoryImpl implements SearchAddressRepository {
  final _dataSource = SearchAddressDataSource();

  @override
  Future<Result<List<AddressData>>> getAddressData(String query) async {
    return await _dataSource.getAddress(query);
  }
}
