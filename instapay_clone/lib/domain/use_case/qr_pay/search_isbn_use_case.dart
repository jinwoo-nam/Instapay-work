import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/qr_pay/book_order_data.dart';
import 'package:instapay_clone/domain/repository/qr_pay/search_isbn_repository.dart';

class SearchIsbnUseCase {
  SearchIsbnRepository repository;

  SearchIsbnUseCase(this.repository);

  Future<Result<BookOrderData>> call(String isbn) async {
    return await repository.searchIsbn(isbn);
  }
}