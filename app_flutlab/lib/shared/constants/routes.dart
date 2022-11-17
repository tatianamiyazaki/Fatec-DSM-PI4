class Routes {
  static const String authService =
      "https://identitytoolkit.googleapis.com/v1/";

  static const String apiKey = "AIzaSyAyfZZZuNw7qK4NoOSXnuKJ1kTojp5hzrc";

  String signIn() {
    return authService + "accounts:signInWithPassword?key=" + apiKey;
  }

  String signUp() {
    return authService + "accounts:signUp?key=" + apiKey;
  }

  String api() {
    return "http://projetopi4.duckdns.org:8123/api/states/sensor.estacao_met_dht11_dht11_temperature";
  }
}
