import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'inventory_widget.dart' show InventoryWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class InventoryModel extends FlutterFlowModel<InventoryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, InventorymangementRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in listViewStreamSubscriptions2) {
      s?.cancel();
    }
    listViewPagingController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, InventorymangementRecord>
      setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, InventorymangementRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, InventorymangementRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryInventorymangementRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
