import '/flutter_flow/flutter_flow_util.dart';
import 'chatbott_widget.dart' show ChatbottWidget;
import 'package:flutter/material.dart';

class ChatbottModel extends FlutterFlowModel<ChatbottWidget> {
  ///  Local state fields for this page.

  String prompt = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - chatGPT] action in Button widget.
  String? chatbotResult;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
