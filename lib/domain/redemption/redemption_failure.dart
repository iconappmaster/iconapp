import 'package:freezed_annotation/freezed_annotation.dart';

part 'redemption_failure.freezed.dart';

@freezed
abstract class RedemptionFailure with _$RedemptionFailure {
  const factory RedemptionFailure.noActiveRedemption() = NoActiveRedemption;
  const factory RedemptionFailure.noMoney() = NoMoney;
  const factory RedemptionFailure.serverError() = ServerError;
}
