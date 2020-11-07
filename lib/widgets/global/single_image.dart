import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconapp/core/theme.dart';
import 'package:iconapp/widgets/global/pinch_zoom.dart';

import 'blur_appbar.dart';

class SingleImage extends StatelessWidget {
  final String url;

  const SingleImage({
    Key key,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: InteractiveViewer(
        child: Stack(
          children: [
            Center(
              child: PinchZoomImage(
                image: CachedNetworkImage(
                  imageUrl: url,
                  fadeOutDuration: const Duration(milliseconds: 250),
                  fadeInCurve: Curves.bounceIn,
                  fit: BoxFit.cover,
                  useOldImageOnUrlChange: true,
                  progressIndicatorBuilder: (context, url, data) {
                    return Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                          value: data.progress,
                          valueColor: AlwaysStoppedAnimation(cornflower),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            BluredAppbar(),
          ],
        ),
      ),
    );
  }
}
