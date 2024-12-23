import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final box = GetStorage();

  bool get isFristOpen => box.read('isFristOpen') ?? true;
  int get selectedLang => box.read('selectedLang') ?? 0;

  Future updateSelectedLang(int newValue) async =>
      await box.write('selectedLang', newValue);

  Future updateIsFristOpen(bool newValue) async =>
      await box.write('isFristOpen', newValue);
}
