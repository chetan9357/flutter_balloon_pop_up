import 'package:flutter/material.dart';
import 'package:flutter_balloon_pop_up/core/utils/popup_position.dart';
import '../widgets/balloon_popup/balloon_popup.dart';
import '../widgets/balloon_popup/balloon_popup_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final BalloonPopupController topController;
  late final BalloonPopupController bottomController;
  late final BalloonPopupController leftController;
  late final BalloonPopupController rightController;

  @override
  void initState() {
    super.initState();
    topController = BalloonPopupController();
    bottomController = BalloonPopupController();
    leftController = BalloonPopupController();
    rightController = BalloonPopupController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Balloon Popup Demo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BalloonPopup(
              textStyle: TextStyle(color: Colors.red),
              backgroundColor: Colors.black,
              borderRadius: 24,
              controller: topController,
              message: 'Top Popup 🎈',
              position: PopupPosition.top,
              child: ElevatedButton(
                onPressed: () {
                  topController.show();
                  Future.delayed(
                    const Duration(seconds: 2),
                    topController.hide,
                  );
                },
                child: const Text('Show Top Popup'),
              ),
            ),
          ),

          const SizedBox(height: 40),
          Center(
            child: BalloonPopup(
              textStyle: TextStyle(color: Colors.red),
              backgroundColor: Colors.black,
              borderRadius: 24,
              controller: leftController,
              message: 'Left Popup 🎈',
              position: PopupPosition.left,
              child: ElevatedButton(
                onPressed: () {
                  leftController.show();
                  Future.delayed(
                    const Duration(seconds: 2),
                    leftController.hide,
                  );
                },
                child: const Text('Show Top Popup'),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: BalloonPopup(
              textStyle: TextStyle(color: Colors.red),
              backgroundColor: Colors.black,
              borderRadius: 24,
              controller: rightController,
              message: 'Right Popup 🎈',
              position: PopupPosition.right,
              child: ElevatedButton(
                onPressed: () {
                  rightController.show();
                  Future.delayed(
                    const Duration(seconds: 2),
                    rightController.hide,
                  );
                },
                child: const Text('Show Top Popup'),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: BalloonPopup(
              controller: bottomController,
              message: 'Bottom Popup 🎈',
              position: PopupPosition.bottom,
              child: ElevatedButton(
                onPressed: () {
                  bottomController.show();
                  Future.delayed(
                    const Duration(seconds: 2),
                    bottomController.hide,
                  );
                },
                child: const Text('Show Bottom Popup'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
