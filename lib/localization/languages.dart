import 'package:get/get.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
          'password_hint': 'Enter password',
          'internet_exception':
              "We are not enable to show result.\nPlease check your internet connection",
          'general_exception':
              "We are not enable to process your request.\nPlease try again later",
          'retry': "Retry",
          'welcome':"Welcome back",
          'login':"Login"
        },
        'hindi_IND': {
          'email_hint': 'ईमेल दर्ज करें',
          'internet_exception':
              "हम परिणाम दिखाने में सक्षम नहीं हैं।\nकृपया अपना इंटरनेट कनेक्शन जांचें",
          'general_exception':
              "हम आपके अनुरोध को संसाधित करने में सक्षम नहीं हैं।\nकृपया बाद में पुनः प्रयास करें",
          'retry': "पुन: प्रयास करें",
          'welcome':"वापसी पर स्वागत है",
          'login':"लॉग इन",
          'password_hint': 'पास वर्ड दर्ज करें',
        }
      };
}
