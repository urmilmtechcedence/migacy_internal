class AppStrings {
  /// In Snack bar
  static const connected = "Internet is connected.";
  static const noConnected = "Internet is not connected.";

  static const inCorrectOtp = "Passcode you've entered is incorrect";

  //Intro screen text string
  static const strSkip = "Skip";
  static const strIntroMessageOne =
      "Create memories of your anniversaries, \nof recipes, generational wisdom";
  static const strIntroMessageTwo =
      "Learn from a generation with \nvast experience and knowledge.";

  static const strDone = "Done";
  static const strSignUp = "Sign Up";
  static const strSignIn = "Sign In";
}

class ErrorMessages {
  static const invalidCode = 'Invalid Code';

  ErrorMessages._privateConstructor();

  static const unauthorized = 'You are not authorized';
  static const noInternet =
      "Can't connected to internet\nPlease check your network settings!";
  static const connectionTimeout = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
  static const wrongOtp = "Wrong confirmation code";

  /// Login Screen
  static const validEmailPhoneMessage = "Please enter valid Email/Phone";
  static const emptyPasswordMessage = "Please enter password";
  static const validPhoneNumber = "Please enter a phone number";

  static const noInternetDialog =
      "Count not connected to server\nPlease check your internet connection!";
}
