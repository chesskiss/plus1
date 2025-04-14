import '/components/nav_bar/nav_bar_widget.dart';
import '/components/web_components/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'main_profile_widget.dart' show MainProfileWidget;
import 'package:flutter/material.dart';

class MainProfileModel extends FlutterFlowModel<MainProfileWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> invitations = [];
  void addToInvitations(DocumentReference item) => invitations.add(item);
  void removeFromInvitations(DocumentReference item) =>
      invitations.remove(item);
  void removeAtIndexFromInvitations(int index) => invitations.removeAt(index);
  void insertAtIndexInInvitations(int index, DocumentReference item) =>
      invitations.insert(index, item);
  void updateInvitationsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      invitations[index] = updateFn(invitations[index]);

  /// Both users that invited you or matched
  List<DocumentReference> invitersAndMatches = [];
  void addToInvitersAndMatches(DocumentReference item) =>
      invitersAndMatches.add(item);
  void removeFromInvitersAndMatches(DocumentReference item) =>
      invitersAndMatches.remove(item);
  void removeAtIndexFromInvitersAndMatches(int index) =>
      invitersAndMatches.removeAt(index);
  void insertAtIndexInInvitersAndMatches(int index, DocumentReference item) =>
      invitersAndMatches.insert(index, item);
  void updateInvitersAndMatchesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      invitersAndMatches[index] = updateFn(invitersAndMatches[index]);

  ///  State fields for stateful widgets in this page.

  // Model for Side_nav component.
  late SideNavModel sideNavModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    sideNavModel.dispose();
    tabBarController?.dispose();
    navBarModel.dispose();
  }
}
