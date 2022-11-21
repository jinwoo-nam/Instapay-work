import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/setting/juso_search_result_data.dart';

abstract class JipZipRepository {
  Future<void> getJip(String token, String jip);

  Future<Result<List<JusoSearchResultData>>> getZip(String token, String zip);
}
