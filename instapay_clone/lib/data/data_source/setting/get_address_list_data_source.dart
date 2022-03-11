import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

class GetAddressListDataSource{
  Future<Result<List<AddressData>>> getAddressList() async {
    return Result.success(addressList);
  }
}

List<AddressData> addressList = [

];