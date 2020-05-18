import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

abstract class Environment {

  // debug
  static String urlDebug = 'https://multi-repuestos.com/wp-json';
  static String urlRelease = 'https://multi-repuestos.com/wp-json';

  // produccion
  // static String urlDebug = 'http://192.168.0.16:8082/api';
  // static String urlRelease = 'http://192.168.0.16:8082/api';

  //static String databaseName = "mts.db";
  static NumberFormat localCurrency = NumberFormat("\$ #,##0", "es_CL");
  static NumberFormat localPercentage = NumberFormat("#,##0.0 \%", "es_CL");
  static DateFormat localShortdate = DateFormat('dd-MM-yyyy');
  static DateFormat localShorttime = DateFormat('HH:mm');
  static DateFormat localLongdate = DateFormat('dd MMM yyyy');
  static String tokenAPI = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbXVsdGktcmVwdWVzdG9zLmNvbSIsImlhdCI6MTU4OTUyNDk2MywibmJmIjoxNTg5NTI0OTYzLCJleHAiOjE1OTAxMjk3NjMsImRhdGEiOnsidXNlciI6eyJpZCI6IjEifX19.Q8sTR1-91B8-WYc_s5X5C0DXG-yEMUBsQ2COgpmbDYY';
  
  static int idUltimaPublicacion = 0;

  static String wsSiteUrl() {
    if (kReleaseMode) {
      return urlRelease;
    }
    else {
      return urlDebug;
    }
  }

}