
import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/features/cart/data/datasourses/cart_remote_data_source.dart';
import 'package:e_commerce/features/check_out/domain/repository/check_out_repository.dart';

class CheckOutRepositoryImpl extends CheckOutRepository {
  final NetworkInfo networkInfo;
  final CartRemoteDataSource remoteDataSource;

  CheckOutRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
// //! get cart:
//   @override
//   Future<Either<Failure, CartEntity>> getCart() async {
//     if (await networkInfo.isConnected!) {
//       try {
//         final remoteGetCart = await remoteDataSource.getCart();
//         return Right(remoteGetCart);
//       } on ServerException catch (e) {
//         return Left(Failure(errMessage: e.errorModel.errorMessage));
//       }
//     } else {
//       return Left(
//         Failure(
//           errMessage: remoteDataSource.noInternectConnection(),
//         ),
//       );
//     }
//   }
// //! confirm modify products:
//   @override
//   Future<Either<Failure, List<ModifyCartEntity>>> modifyCart(
//       {required bodyJson}) async {
//     if (await networkInfo.isConnected!) {
//       try {
//         final List<ModifyCartEntity> remotePostCart =
//             await remoteDataSource.modifyCart(bodyJson);

//         return Right(remotePostCart);
//       } on ServerException catch (e) {
//         return Left(Failure(errMessage: e.errorModel.errorMessage));
//       }
//     } else {
//       return Left(
//         Failure(
//           errMessage: remoteDataSource.noInternectConnection(),
//         ),
//       );
//     }
//   }
// //! confirm delete products:
//   @override
//   Future<Either<Failure, MessageEntity>> deleteCart({required Map<String, dynamic> bodyJson})async {
//   if (await networkInfo.isConnected!) {
//   try {
//         final remoteDeleteCart = await remoteDataSource.deleteCart(bodyJson);
//         return Right(remoteDeleteCart);
//       } on ServerException catch (e) {
//         return Left(Failure(errMessage: e.errorModel.errorMessage));
//       }
//     } else {
//       return Left(
//         Failure(
//           errMessage: remoteDataSource.noInternectConnection(),
//         ),
//       );
//     }
//   }
// //! clear cart:
//   @override
//   Future<Either<Failure, MessageEntity>> clearCart() async {
//   if (await networkInfo.isConnected!) {
//   try {
//         final remoteClearCart = await remoteDataSource.clearCart();
//         return Right(remoteClearCart);
//       } on ServerException catch (e) {
//         return Left(Failure(errMessage: e.errorModel.errorMessage));
//       }
//     } else {
//       return Left(
//         Failure(
//           errMessage: remoteDataSource.noInternectConnection(),
//         ),
//       );
//     }
//   }
}
