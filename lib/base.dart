import 'package:flutter/material.dart';

abstract class BaseConnector {
  showloading();
  closeLoading();
  showMessage(String message);
}

class BaseViewModel<C extends BaseConnector> extends ChangeNotifier {
  C? connector;
}

abstract class BaseView<S extends StatefulWidget, VM extends BaseViewModel>
    extends State<S> implements BaseConnector {
  late VM viewmodel;
  VM initMyViewModel();

  @override
  void initState() {
    super.initState();
    viewmodel = initMyViewModel();
  }

  @override
  closeLoading() {
    Navigator.pop(context);
  }

  @override
  showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("ERORR !!!"),
          content: Text(message),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      },
    );
  }

  @override
  showloading() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
