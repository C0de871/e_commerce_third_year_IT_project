// role_update_service.dart
import 'dart:async';

class RoleUpdateService {
  // Stream controller for role updates
  static final _roleUpdateController = StreamController<RoleUpdate>.broadcast();

  // Stream getter
  static Stream<RoleUpdate> get roleUpdates => _roleUpdateController.stream;

  // Method to add new role update to stream
  static void updateRole({required int userId, required String newRole}) {
    _roleUpdateController.add(
      RoleUpdate(userId: userId, newRole: newRole),
    );
  }

  // Dispose method
  static void dispose() {
    _roleUpdateController.close();
  }
}

// Model for role updates
class RoleUpdate {
  final int userId;
  final String newRole;

  RoleUpdate({required this.userId, required this.newRole});
}