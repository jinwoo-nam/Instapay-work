import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/data/data_source/means/means_api.dart';
import 'package:instapay_clone/domain/model/my_wallet/means_data.dart';
import 'package:instapay_clone/domain/repository/means/means_repository.dart';

class MeansRepositoryImpl extends MeansRepository {
  final MeansApi _dataSource = MeansApi();

  MeansRepositoryImpl();

  @override
  Future<Result<List<MeansData>>> getMeans(String token) async {
      return await _dataSource.getMeans(token);
  }

  @override
  Future<void> updateMeans(String token, String mid) async {
    await _dataSource.updateMeans(token, mid);
  }

  @override
  Future<Result<String>> getDefaultMeans(String token) async {
    return await _dataSource.getDefaultMeans(token);
  }

  @override
  Future<Result<String>> deleteMeans(String token, String mid) async {
    return await _dataSource.deleteMeans(token, mid);
  }
}
