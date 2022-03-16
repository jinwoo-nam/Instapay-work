import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/qr_pay/search_isbn_data_source.dart';
import 'package:instapay_clone/domain/repository/qr_pay/search_isbn_repository.dart';

import '../../../domain/model/qr_pay/book_order_data.dart';

class SearchISBNRepositoryImpl implements SearchIsbnRepository {
  final _dataSource = SearchIsbnDataSource();

  @override
  Future<Result<BookOrderData>> searchIsbn(String isbn) async {
    return await _dataSource.searchIsbn(isbn);
  }
}
