import 'package:latlong2/latlong.dart';
import '../entities/ride_tracking_entity.dart';

abstract class RideRepository {
  Stream<RideTrackingEntity> getRideTrackingStream();
  Future<List<LatLng>> getRoutePoints();
}
