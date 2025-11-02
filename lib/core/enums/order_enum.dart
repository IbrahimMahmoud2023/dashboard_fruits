import 'dart:ui';

import 'package:flutter/material.dart';

enum OrderStatus {
  pending, // الطلب في انتظار الموافقة
  accepted, // الطلب تم شحنه
  delivered, // الطلب تم توصيله
  cancelled // تم إلغاء الطلب

}


