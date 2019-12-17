import 'package:conferenceapp/model/talk.dart';
import 'package:flutter/material.dart';

import 'speakers.dart';

class TitleWrapper extends StatelessWidget {
  const TitleWrapper({
    Key key,
    @required this.topPadding,
    @required this.talk,
    @required this.compact,
  }) : super(key: key);

  final double topPadding;
  final Talk talk;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: topPadding,
        left: 16,
        right: 16,
      ),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TalkTitle(talk: talk, compact: compact),
              Flexible(child: SpeakersHeightEquivalent(talk: talk)),
            ],
          ),
        ],
      ),
    );
  }
}

class TalkTitle extends StatelessWidget {
  const TalkTitle({
    Key key,
    @required this.talk,
    @required this.compact,
  }) : super(key: key);

  final Talk talk;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (talk == null) return Container();

    return Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: TalkTitleText(
              title: talk.title,
              compact: compact,
            ),
          ),
        ),
      ],
    );
  }
}

class TalkTitleText extends StatelessWidget {
  const TalkTitleText({
    Key key,
    @required this.title,
    @required this.compact,
  }) : super(key: key);

  final String title;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: Duration(milliseconds: 400),
      style: compact
          ? Theme.of(context)
              .textTheme
              .body2
              .copyWith(fontSize: 16, fontWeight: FontWeight.w400)
          : Theme.of(context)
              .textTheme
              .body2
              .copyWith(fontSize: 20, fontWeight: FontWeight.w400),
      child: Text(
        title,
      ),
    );
  }
}
