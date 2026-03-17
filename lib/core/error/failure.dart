abstract class Failure {
  Failure({required this.message, this.statusCode = 0});

  final String message;
  final int? statusCode;
}

class UnimplementedFailure extends Failure {
  UnimplementedFailure({super.message = 'Unimplemented Failure'});
}

class ServerFailure extends Failure {
  ServerFailure({super.message = 'Server Failure', super.statusCode});
}
