import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/repository/setting/register_address_repository.dart';

class RegisterAddressUseCase {
  RegisterAddressRepository repository;

  RegisterAddressUseCase(this.repository);

  Future<void> call(AddressData address) async {
    await repository.registerAddress(address);
  }

  Future<void> setDefaultAddress(AddressData? address) async {
    await repository.setDefaultAddress(address);
  }


}
