class AppAPI {
  //API for Auth / User
  //GET method
  static const String currentUser = '/user/me';
  static const String userInformation = '/user/:idUser';

  //POST method
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String logout = '/auth/logout';

  //API for Classrooms
  //GET method
  static const String allListOfClassroom = '/classroom';
  static const String classroomDetails = '/classroom';
  static const String allStudentsOfAllClassrooms = '/student';
  static const String allListOfLesson = '/lesson';
  static const String lessonDetails = '/lesson/:idLesson';
  static const String statisticalDashboard = '/dashboard';
  //POST method
  static const String createNewClassroom = '/classroom';

  //API for Payment
  //POST method
  static const String createOrder = '/classroom/create-order';
}
