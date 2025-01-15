import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/features/cart/data/datasourses/cart_remote_data_source.dart';
import 'package:e_commerce/features/check_out/data/datasourses/check_out_remote_data_source.dart';
import 'package:e_commerce/features/check_out/domain/entites/check_out_order/check_out_order_entity.dart';
import 'package:e_commerce/features/check_out/domain/repository/check_out_repository.dart';

class CheckOutRepositoryImpl extends CheckOutRepository {
  final NetworkInfo networkInfo;
  final CheckOutRemoteDataSource remoteDataSource;

  CheckOutRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  //! create order:

  @override
  Future<Either<Failure,CheckOutOrderEntity>> createOrder( {required  bodyJson
  } ) async{
if (await networkInfo.isConnected!) {
      try {
        final remoteCreateOrderCart = await remoteDataSource.createOrder(bodyJson: bodyJson);
        return Right(remoteCreateOrderCart);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(
        Failure(
          errMessage: remoteDataSource.noInternectConnection(),
        ),
      );
    }
  }
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
