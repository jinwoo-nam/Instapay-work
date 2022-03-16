import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/qr_pay/book_order_data.dart';

class SearchIsbnDataSource {
  Future<Result<BookOrderData>> searchIsbn(String isbn) async {
    try {
      return Result.success(bookData);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}

final bookData = BookOrderData(
  bookName: '요범사훈(운명에 속지 말고 주인공이 되자)',
  affiliate: '인스타북스',
  orderNumber: 'Z29-H48TH',
  amountOfMoney: 9540,
);
