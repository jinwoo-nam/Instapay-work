import 'package:instapay_clone/data/data_source/setting/get_address_list_data_source.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

class DeleteAddressDataSource {
  Future<void> deleteAddress(AddressData address) async{
    try {
      addressList.remove(address);
    } on Exception {

    }
  }
}