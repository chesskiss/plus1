import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/main_feed_post_walkthrough/main_feed_post_walkthrough_widget.dart';
import '/walkthrough/main_feed_post_slide_walkthrough/main_feed_post_slide_walkthrough_widget.dart';
import '/walkthrough/main_feed_create_post_walkthrough/main_feed_create_post_walkthrough_widget.dart';

// Focus widget keys for this walkthrough
final container4h9j383w = GlobalKey();
final floatingActionButton5f9epi1d = GlobalKey();

/// mainFeed
///
/// The first tutorial the user will encounter once they register.
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Post explanation: Create an event - walkthrough explanation
      TargetFocus(
        keyTarget: container4h9j383w,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MainFeedPostWalkthroughWidget(),
          ),
        ],
      ),

      /// Sliding post: How to drag the post
      TargetFocus(
        keyTarget: container4h9j383w,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => MainFeedPostSlideWalkthroughWidget(),
          ),
        ],
      ),

      /// Create event explanation
      TargetFocus(
        keyTarget: floatingActionButton5f9epi1d,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => MainFeedCreatePostWalkthroughWidget(),
          ),
        ],
      ),
    ];
