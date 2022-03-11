import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/repository/setting/search_address_repository.dart';

class SearchAddressUseCase {
  SearchAddressRepository repository;

  SearchAddressUseCase(this.repository);

  Future<Result<List<AddressData>>> call(String query) async {
    final addressList = repository.getAddressData(query);

    return addressList;
  }
}
