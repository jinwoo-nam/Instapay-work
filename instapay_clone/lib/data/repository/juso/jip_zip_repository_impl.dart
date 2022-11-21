import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/juso/jip_zip_api.dart';
import 'package:instapay_clone/domain/model/setting/juso_search_result_data.dart';
import 'package:instapay_clone/domain/repository/juso/jip_zip_repository.dart';

class JipZipRepositoryImpl extends JipZipRepository {
  final JipZipApi _dataSource = JipZipApi();

  @override
  Future<void> getJip(String token, String jip) async {
    await _dataSource.getJip(token, jip);
  }

  @override
  Future<Result<List<JusoSearchResultData>>> getZip(String token, String zip) async {
    return await _dataSource.getZip(token, zip);
  }
}
