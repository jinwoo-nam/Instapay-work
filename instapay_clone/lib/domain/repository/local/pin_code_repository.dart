abstract class PinCodeRepository {
  Future<String> loadPinCode();

  Future<void> savePinCode(String pinCode);

  Future<void> deletePinCode();
}
