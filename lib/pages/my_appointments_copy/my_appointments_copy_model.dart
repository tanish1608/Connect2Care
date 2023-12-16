import '/components/main_logo/main_logo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_appointments_copy_widget.dart' show MyAppointmentsCopyWidget;
import 'package:flutter/material.dart';

class MyAppointmentsCopyModel
    extends FlutterFlowModel<MyAppointmentsCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for main_Logo component.
  late MainLogoModel mainLogoModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mainLogoModel = createModel(context, () => MainLogoModel());
  }

  @override
  void dispose() {
    mainLogoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
