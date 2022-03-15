import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';
import 'package:instapay_clone/domain/repository/setting/get_address_repository.dart';

class GetAddressUseCase {
  GetAddressRepository repository;

  GetAddressUseCase(this.repository);

  Future<Result<List<AddressData>>> call() async {
    return await repository.getAddressData();
  }

  Future<Result<AddressData?>> getDefaultAddress() async {
    return await repository.getDefaultAddressData();
  }
}
