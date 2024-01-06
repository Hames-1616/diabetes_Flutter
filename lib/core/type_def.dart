import 'package:diabetes_app/core/Failure.dart';
import 'package:fpdart/fpdart.dart';


typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;