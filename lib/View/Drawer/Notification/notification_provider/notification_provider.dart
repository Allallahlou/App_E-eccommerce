import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final List<Map<String, String>> _notifications = [];

  List<Map<String, String>> get notifications => _notifications;

  void addNotification(String title, String body, {String? image, String? time}) {
    _notifications.insert(0, {
      "title": title,
      "body": body,
      "time": "Just now",
    });
    notifyListeners();
  }
  void clearNotifications() {
  _notifications.clear();
  notifyListeners();
}

void addNotificationFromMap(Map<String, String> notification) {
  _notifications.add(notification);
  notifyListeners();
}

}
