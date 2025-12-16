import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_check_in_app/bloc/connectivity_cubit.dart';
import 'package:internet_check_in_app/ui/no_internet_page.dart';

class ConnectivityListener extends StatelessWidget {
  final Widget child;
  final Widget? noInternetWidget;

  const ConnectivityListener({
    super.key,
    required this.child,
    this.noInternetWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConnectivityCubit(),
      child: BlocListener<ConnectivityCubit, ConnectivityStatus>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state == ConnectivityStatus.disconnected) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => noInternetWidget ?? NoInternetScreen(),
              ),
            );
          } else {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
        child: child,
      ),
    );
  }
}
