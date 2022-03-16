import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

class GetAddressListDataSource {
  Future<Result<List<AddressData>>> getAddressList() async {
    return Result.success(addressList);
  }

  Future<Result<AddressData?>> getDefaultAddress() async {
    return Result.success(defaultAddress);
  }
}

List<AddressData> addressList = [
  AddressData(
      address: '서울 강남구 영동대로 85길 38',
      postCode: 06180,
      detailAddress: '(대치동, 진성빌딩) 701호',
      contact: '02-3453-4920',
      name: '인스타페이'),
];
AddressData? defaultAddress = addressList[0];
