import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/address_data.dart';

class SearchAddressDataSource {
  Future<Result<List<AddressData>>> searchAddress(String query) async {
    try {
      List<AddressData> arr = [];
      for (int i = 0; i < 10; i++) {
        arr.add(AddressData(
          address: '임시주소 $query길 ${i+502}-${i + 100}번지  $query아파트 ${i+1001}동 ',
          postCode: i + 06040,
        ));
      }
      return Result.success(arr);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}
