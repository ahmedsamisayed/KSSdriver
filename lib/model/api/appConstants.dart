import 'package:image_picker/image_picker.dart';

class AppConstants{
  static String? userAccessToken;
  static String? userId;
  static String? userName;
  static String? userEmail;
  static String? userPhone;
  static late XFile uplodedImage;
  static String generalUrl = "http://10.0.2.2:4000/api/v1";
  static String productImageurl = "http://10.0.2.2:4000/assets/productImages";
  static String? bokNumber;
  static String? userPhoneForForgetPassword;
  static String? OTP;
  static double? currentPositionLatitude;
  static double? currentPositionLongitude;
  static String? currentOrderOwnerNumber;
  static String? currentOrderId;
  static List? driverDeliveries;

}