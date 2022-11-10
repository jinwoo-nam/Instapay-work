import 'package:instapay_clone/core/result.dart';
import 'package:instapay_clone/domain/model/kfc/kfc_first_result.dart';

abstract class KfcRepository {
  Future<Result<KfcFirstResult>> kfcFirst(String token);
}
