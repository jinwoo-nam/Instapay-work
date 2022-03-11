import 'package:instapay_clone/domain/model/setting/address_data.dart';

abstract class RegisterAddressRepository {
  Future<void> registerAddress(AddressData address);
}