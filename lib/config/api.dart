class Api {
  static const _host =
      'http://ec2-54-255-189-174.ap-southeast-1.compute.amazonaws.com/tabersa_webservice';
  static const _hostUser = '$_host/user';

  // User

  static const login = '$_hostUser/login.php';
  static const register = '$_hostUser/register.php';
}
