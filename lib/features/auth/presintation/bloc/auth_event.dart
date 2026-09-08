abstract class AuthEvent {

}

class AuthSingUpEvent extends AuthEvent{
final String name;
final String email;
final String password;

AuthSingUpEvent({required this.name, required this.email, required this.password});
}


class AuthLogInEvent extends AuthEvent{
  final String password;
  final String email;

  AuthLogInEvent({required this.password, required this.email});
}


class AuthCurrentUserEvent extends AuthEvent{

}