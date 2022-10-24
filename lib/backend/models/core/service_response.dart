

class ServiceResponse<T> {
  bool status;
  String message;
  T? data;

  ServiceResponse({this.status = false, this.message = "", this.data});
}