import 'package:instapay_clone/domain/repository/local/pin_code_repository.dart';

class PinCodeUseCase {
  PinCodeRepository repository;

  PinCodeUseCase(this.repository);

  Future<String> loadPinCode() async {
    String code = await repository.loadPinCode();

    return code;
  }

  Future<void> savePinCode(String pinCode) async {
    await repository.savePinCode(pinCode);
  }

  Future<void> deletePinCode() async {
    await repository.deletePinCode();
  }
}
