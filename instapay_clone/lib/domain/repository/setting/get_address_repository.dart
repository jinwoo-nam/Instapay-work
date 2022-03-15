import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

abstract class GetAddressRepository {
  Future<Result<List<AddressData>>> getAddressData();

  Future<Result<AddressData?>> getDefaultAddressData();

}