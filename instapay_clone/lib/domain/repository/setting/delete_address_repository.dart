import 'package:instapay_clone/domain/model/setting/address_data.dart';

abstract class DeleteAddressRepository {
    Future<void> deleteAddress(AddressData address);
}