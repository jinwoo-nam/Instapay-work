import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/qr_pay/book_order_data.dart';

abstract class SearchIsbnRepository {
  Future<Result<BookOrderData>> searchIsbn(String isbn);
}