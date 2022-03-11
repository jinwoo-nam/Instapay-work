import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'address_data.freezed.dart';
part 'address_data.g.dart';

@freezed
class AddressData with _$AddressData {
  factory AddressData({
    required String address,
    required int postCode,
    String? detailAddress,
    String? contact,
    String? name,
}) = _AddressData;
  factory AddressData.fromJson(Map<String, dynamic> json) => _$AddressDataFromJson(json);
}