import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_check_in_app/ui/no_internet_page.dart';

class ConnectivityListener extends StatefulWidget {
  final Widget child;
  final Widget? noInternetWidget;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Duration checkInterval;

  const ConnectivityListener({
    super.key,
    required this.child,
    this.noInternetWidget,
    this.navigatorKey,
    this.checkInterval = const Duration(seconds: 2),
  });

  @override
  State<ConnectivityListener> createState() => _ConnectivityListenerState();
}

class _ConnectivityListenerState extends State<ConnectivityListener> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  final Connectivity _connectivity = Connectivity();
  bool _isDisconnected = false;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      _handleConnectivityChange(results);
    });
  }

  void _handleConnectivityChange(List<ConnectivityResult> results) {
    bool isCurrentlyDisconnected = results.contains(ConnectivityResult.none);

    // Logic: if it contains 'none' it might be disconnected, but if it ALSO contains wifi/mobile it might be connected (e.g. VPN logic).
    // However, connectivity_plus usually returns [none] if no connection.
    // If list is empty -> disconnected

    if (results.isEmpty) {
      isCurrentlyDisconnected = true;
    }

    if (isCurrentlyDisconnected && !_isDisconnected) {
      _isDisconnected = true;
      _navigateToNoInternet();
    } else if (!isCurrentlyDisconnected && _isDisconnected) {
      _isDisconnected = false;
      _popNoInternet();
    }
  }

  void _navigateToNoInternet() {
    if (widget.navigatorKey != null) {
      widget.navigatorKey!.currentState?.push(
        MaterialPageRoute(
          builder: (_) => widget.noInternetWidget ?? const NoInternetScreen(),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => widget.noInternetWidget ?? const NoInternetScreen(),
        ),
      );
    }
  }

  void _popNoInternet() {
    try {
      if (widget.navigatorKey != null) {
        widget.navigatorKey!.currentState?.pop();
      } else {
        Navigator.of(context).pop();
      }
    } catch (e) {
      debugPrint("Error popping no internet screen: $e");
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
