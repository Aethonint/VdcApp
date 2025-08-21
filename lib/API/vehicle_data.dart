library vehicle_data;

/// Stores the globally assigned vehicle number
String? globalVehicleNo;

/// Stores the globally assigned assignment ID
int? globalAssignmentId;

/// Clears vehicle assignment data (useful on logout)
void clearVehicleData() {
  globalVehicleNo = null;
  globalAssignmentId = null;
}
