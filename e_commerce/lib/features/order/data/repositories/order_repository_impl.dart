import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/databases/connection/network_info.dart';
import 'package:e_commerce/core/databases/errors/expentions.dart';
import 'package:e_commerce/core/databases/errors/failure.dart';
import 'package:e_commerce/core/databases/params/params.dart';
import 'package:e_commerce/core/shared/domain/entities/message_entety.dart';
import 'package:e_commerce/features/order/domain/entites/order_entity.dart';
import 'package:e_commerce/features/order/domain/repository/order_repository.dart';
import '../datasourses/order_remote_data_source.dart';

class OrderRepositoryImpl extends OrderRepository {
  final NetworkInfo networkInfo;
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
//! get order:
  @override
  Future<Either<Failure, OrderEntity>> getOrder() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteGetOrder = await remoteDataSource.getOrder();
        return Right(remoteGetOrder);
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

  @override
  Future<Either<Failure, MessageEntity>> deleteOrder({
    required GetOrderIdParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final MessageEntity messageEntity = await remoteDataSource.deleteOrder(
          params,
        );

        return Right(messageEntity);
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
  //! create order:

  // @override
//   Future<Either<Failure,CheckOutOrderEntity>> createOrder( {required  bodyJson
//   } ) async{
// if (await networkInfo.isConnected!) {
//       try {
//         final remoteCreateOrderCart = await remoteDataSource.createOrder(bodyJson: bodyJson);
//         return Right(remoteCreateOrderCart);
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
