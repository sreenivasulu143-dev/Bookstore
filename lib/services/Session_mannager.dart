class SessionController{
  static final SessionController _session = SessionController._internal();
  String? UserId;
  factory SessionController(){
    return _session;
  }
  SessionController._internal(){

  }
}