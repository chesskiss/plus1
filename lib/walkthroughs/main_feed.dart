import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/main_feed_create_post_walkthrough_widget.dart';
import '/components/main_feed_post_walkthrough_widget.dart';

// Focus widget keys for this walkthrough
final columnDa753bdz = GlobalKey();
final floatingActionButton5f9epi1d = GlobalKey();

/// mainFeed
///
/// The first tutorial the user will encounter once they register.
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Post explanation
      TargetFocus(
        keyTarget: columnDa753bdz,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const MainFeedCreatePostWalkthroughWidget(),
          ),
        ],
      ),

      /// Create event explanation: Create an event - walkthrough explanation
      TargetFocus(
        keyTarget: floatingActionButton5f9epi1d,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const MainFeedPostWalkthroughWidget(),
          ),
        ],
      ),
    ];
