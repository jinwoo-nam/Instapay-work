import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/repository/setting/delete_address_repository.dart';

class DeleteAddressUseCase {
  DeleteAddressRepository repository;

  DeleteAddressUseCase(this.repository);

  Future<void> call(AddressData address) async {
    await repository.deleteAddress(address);
  }
}
