import 'package:e_learning_klass/common/apis/user_api.dart';
import 'package:e_learning_klass/common/entities/entities.dart';

import 'package:e_learning_klass/global.dart';

class NavBavController {
  late CurrentUserDataEntity currentUserData;

  NavBavController() {
    // Lấy dữ liệu người dùng từ bộ nhớ cục bộ khi khởi tạo
    currentUserData = Global.storageService.getCurrentUserData();
  }

  // Hàm lấy dữ liệu người dùng từ API
  Future<CurrentUserDataEntity?> fetchCurrentUser() async {
    try {
      final currentUser = await UserAPI.getCurrentUser();

      if (currentUser.success && currentUser.data != null) {
        currentUserData = currentUser.data!;
        return currentUserData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> init() async {
    print("...Navbar controller init method...");
    await fetchCurrentUser();
  }
}
