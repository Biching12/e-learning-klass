class CurrentUserManager {
  //Singleton instance
  static final CurrentUserManager _instance = CurrentUserManager._internal();
  factory CurrentUserManager() => _instance;

  CurrentUserManager._internal();
}
