import 'package:instapay_clone/data/data_source/setting/get_address_list_data_source.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

class RegisterAddressDataSource {
  Future<void> registerAddress(AddressData address) async {
    try {
      addressList.add(address);
    } on Exception {}
  }

  Future<void> setDefaultAddress(AddressData? address) async {
    try {
      defaultAddress = address;
    } on Exception {}
  }
}
