import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shipa/core/configs/app_colors.dart';
import 'package:shipa/core/configs/app_text_styles.dart';
import 'package:shipa/features/ride/domain/entities/ride_tracking_entity.dart';

class CourierTrackingCard extends StatelessWidget {
  final RideTrackingEntity rideTracking;
  const CourierTrackingCard({super.key, required this.rideTracking});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 18.h),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              children: [
                SvgPicture.asset("assets/svgs/clock.svg"),
                9.horizontalSpace,
                Expanded(
                  child: Text(
                    "The package is estimated to arrive within the next ${rideTracking.estimatedArrival}.",
                    style: AppTextStyles.bodySmall,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
          14.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 19.h),
            decoration: BoxDecoration(
              color: AppColors.grey.withValues(alpha: .15),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(rideTracking.courierImage),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    14.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rideTracking.courierName,
                          style: AppTextStyles.bodyLarge.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Courier",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.neutralColor300,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.orangeColor,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: SvgPicture.asset(
                              "assets/svgs/phone.svg",
                              height: 14,
                              width: 14,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          5.horizontalSpace,
                          Text(
                            "Call",
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                18.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ID",
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.neutralColor300,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          rideTracking.orderId,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.orangeLight.withValues(alpha: .06),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 5,
                            width: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.orangeLight,
                            ),
                          ),
                          5.horizontalSpace,
                          Text(
                            rideTracking.status,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.orangeLight,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.orangeColor2),
                          ),
                          child: Container(
                            height: 16,
                            width: 16,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.orangeColor2,
                            ),
                          ),
                        ),
                        DottedLine(
                          direction: Axis.vertical,
                          dashLength: 5,
                          dashGapLength: 2,
                          lineLength: 55.w,
                          dashColor: AppColors.grey2,
                        ),
                        SvgPicture.asset("assets/svgs/map-pin.svg"),
                      ],
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rideTracking.status,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.neutralColor300,
                                    ),
                                  ),
                                  Text(
                                    "Courier is delivering the package",
                                    style: AppTextStyles.bodySmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "${rideTracking.estimatedArrival} destination",
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.neutralColor300,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "10:47 AM",
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.neutralColor300,
                                    ),
                                  ),
                                  Text(
                                    "18 Jan, 2026",
                                    style: AppTextStyles.bodySmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          28.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivered",
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.neutralColor300,
                                    ),
                                  ),
                                  Text(
                                    "Akobo, Ibadan",
                                    style: AppTextStyles.bodySmall.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 30.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 16.h,
                                      child: DottedLine(
                                        dashLength: 5,
                                        dashGapLength: 2,
                                        lineLength: 61.w,
                                        dashColor: AppColors.neutralColor300,
                                      ),
                                    ),
                                    4.verticalSpace,
                                    SizedBox(
                                      height: 16.h,
                                      child: DottedLine(
                                        dashLength: 5,
                                        dashGapLength: 2,
                                        lineLength: 61.w,
                                        dashColor: AppColors.neutralColor600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
