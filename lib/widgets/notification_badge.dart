import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationBadge extends StatefulWidget {
  dynamic Function()? onTap;
  NotificationBadge({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.black,
        child: badges.Badge(
          child: SvgPicture.asset("assets/images/notification.svg"),
          onTap: widget.onTap,
          position: badges.BadgePosition.custom(end: 0, top: 1),
          badgeStyle: badges.BadgeStyle(
              badgeColor: Color.fromRGBO(249, 208, 63, 1), padding: EdgeInsets.all(4)),
        ));
  }
}
