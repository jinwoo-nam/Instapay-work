import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_order_data.freezed.dart';
part 'book_order_data.g.dart';

@freezed
class BookOrderData with _$BookOrderData {
  factory BookOrderData({
    required String affiliate,
    required String bookName,
    required String orderNumber,
    required int amountOfMoney,
  }) = _BookOrderData;
  factory BookOrderData.fromJson(Map<String, dynamic> json) => _$BookOrderDataFromJson(json);
}