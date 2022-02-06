class Result<E> {
  bool success;
  String message;
  E? data;

  Result(this.success, this.message, this.data);
  Result.withoutData(this.success, this.message);

  Result.succes(this.data, {this.message = "Successful", this.success = true});
  Result.error({this.message = "Failed", this.success = false});
}
