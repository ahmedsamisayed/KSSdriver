import 'package:image_picker/image_picker.dart';
import 'package:kss_driver/model/api/getSingleOrder/getSingleOrderResponse.dart';

class AppConstants{
  static String? userAccessToken;
  static String? userId;
  static String? userName;
  static String? userEmail;
  static String? userPhone;
  static late XFile uplodedImage;
  static String generalUrl = "http://192.168.43.198:4000/api/v1";
  static String productImageurl = "http://192.168.43.198:4000/assets/productImages";
  static String? bokNumber;
  static String? userPhoneForForgetPassword;
  static String? OTP;
  static double? currentPositionLatitude;
  static double? currentPositionLongitude;
  static String? currentOrderOwnerNumber1;
  static String? currentOrderOwnerNumber2;
  static String? currentOrderId;
  static List? driverDeliveries;
  static List driverOrders = [];

}