import 'dart:async';
import 'package:latlong2/latlong.dart';
import '../../domain/entities/ride_tracking_entity.dart';

abstract class RideRemoteDataSource {
  Stream<RideTrackingEntity> watchRideTracking();
  Future<List<LatLng>> getRoute();
}

class MockRideRemoteDataSourceImpl implements RideRemoteDataSource {
  final List<LatLng> _mockRoute = [
    const LatLng(6.5244, 3.3792),
    const LatLng(6.5260, 3.3810),
    const LatLng(6.5285, 3.3825),
    const LatLng(6.5300, 3.3850),
    const LatLng(6.5320, 3.3875),
    const LatLng(6.5345, 3.3900),
  ];

  @override
  Future<List<LatLng>> getRoute() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockRoute;
  }

  @override
  Stream<RideTrackingEntity> watchRideTracking() async* {
    int index = 0;
    while (index < _mockRoute.length) {
      yield RideTrackingEntity(
        currentLocation: _mockRoute[index],
        routePoints: _mockRoute,
        destination: _mockRoute.last,
        courierName: "Mohamed Mostafa",
        courierImage: "assets/images/courier_picture.jpg",
        courierPhone: "+234 812 345 6789",
        orderId: "ORD-682834513",
        status: "On Delivery",
        estimatedArrival: "${25 - (index * 4)} minutes",
      );
      index++;
      await Future.delayed(const Duration(seconds: 4));
    }
  }
}
