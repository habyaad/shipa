import 'package:latlong2/latlong.dart';

class RideTrackingEntity {
  final LatLng currentLocation;
  final List<LatLng> routePoints;
  final LatLng destination;
  final String courierName;
  final String courierImage;
  final String courierPhone;
  final String orderId;
  final String status;
  final String estimatedArrival;

  RideTrackingEntity({
    required this.currentLocation,
    required this.routePoints,
    required this.destination,
    required this.courierName,
    required this.courierImage,
    required this.courierPhone,
    required this.orderId,
    required this.status,
    required this.estimatedArrival,
  });
}
