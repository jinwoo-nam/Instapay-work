import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

abstract class SearchAddressRepository {
  Future<Result<List<AddressData>>> searchAddressData(String query);
}