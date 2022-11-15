import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/my_wallet/means_data.dart';

abstract class MeansRepository {
  Future<Result<List<MeansData>>> getMeans(String token);

  Future<void> updateMeans(String token, String mid);

  Future<Result<String>> getDefaultMeans(String token);

  Future<Result<String>> deleteMeans(String token, String mid);
}
