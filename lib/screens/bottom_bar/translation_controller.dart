import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';

class TranslationController extends GetxController {
  static TranslationController get to => Get.find();

  Map<String, Map<String, String>> translations = {
    'en': {
      'Home': 'Home',
      'Search': 'Search',
      'My List': 'My List',
      'Profile': 'Profile',
      'Sports': 'Sports',
      'Movies': 'Movies',
      'Live': 'Live',
      'Anime': 'Anime',
      'Coming Soon': 'Coming Soon',
      'TV shows': 'TV shows',
      'For You': 'For You',
      'Continue watching': 'Continue Watching',
      'Trending In Sports': 'Trending In Sports',
      'Hot Right Now': 'Hot Right Now',
      'Watch In Your Language': 'Watch In Your Language',
    },
    'hi': {
      'Home': 'घर',
      'Search': 'खोज',
      'My List': 'मेरी सूची',
      'Profile': 'प्रोफ़ाइल',
      'Sports': 'खेल',
      'Movies': 'फिल्में',
      'Live': 'लाइव',
      'Anime': 'एनीमे',
      'Coming Soon': 'जल्द ही आ रहा है',
      'TV shows': 'टीवी शो',
      'For You': 'आपके लिए',
      'Continue watching': 'देखना जारी रखें',
      'Trending In Sports': 'खेल में प्रचलित',
      'Trending Right Now': 'अभी ट्रेंडिंग',
      'Hot Right Now': 'अभी गर्म',
      'Watch In Your Language': 'अपनी भाषा में देखें',
    },
    'ar': {
      'Home': 'الصفحة الرئيسية',
      'Search': 'بحث',
      'My List': 'قائمتي',
      'Profile': 'الملف الشخصي',
      'Sports': 'رياضة',
      'Movies': 'أفلام',
      'Live': 'مباشر',
      'Anime': 'أنمي',
      'Coming Soon': 'ريبا',
      'TV shows': 'برامج تلفزيونية',
      'For You': 'لك',
      'Continue watching': 'متابعة المشاهدة',
      'Trending In Sports': 'الشائع في الرياضة',
      'Trending Right Now': 'الأكثر تداولاً الآن',
      'Hot Right Now': 'الأكثر سخونة الآن',
      'Watch In Your Language': 'شاهد بلغتك',
    },
    'zh': {
      'Home': '家',
      'Search': '搜索',
      'My List': '我的列表',
      'Profile': '个人资料',
      'Sports': '体育',
      'Movies': '电影',
      'Live': '直播',
      'Anime': '动漫',
      'Coming Soon': '即将上映',
      'TV shows': '电视剧',
      'For You': '为你',
      'Continue watching': '为你',
      'Trending In Sports': '体育热门 ',
      'Trending Right Now': '当前趋势',
      'Hot Right Now': '现在很火',
      'Watch In Your Language': '用你的语言观看',
    },
    'fr': {
      'Home': 'Accueil',
      'Search': 'Recherche',
      'My List': 'Ma liste',
      'Profile': 'Profil',
      'Sports': 'Sports',
      'Movies': 'Films',
      'Live': 'En direct',
      'Anime': 'Anime',
      'Coming Soon': 'À venir',
      'TV shows': 'Émissions de télévision',
      'For You': 'Pour vous',
      'Continue watching': 'Continuer à regarder',
      'Trending In Sports': 'Tendances dans le sport',
      'Trending Right Now': 'Tendances actuelles',
      'Hot Right Now': 'Chaud en ce moment',
      'Watch In Your Language': 'Regardez dans votre langue',
    },
    'de': {
      'Home': 'Zuhause',
      'Search': 'Suche',
      'My List': 'Meine Liste',
      'Profile': 'Profil',
      'Sports': 'Sport',
      'Movies': 'Filme',
      'Live': 'Live',
      'Anime': 'Anime',
      'Coming Soon': 'Demnächst',
      'TV shows': 'Fernsehsendungen',
      'For You': 'Für dich',
      'Continue watching': 'Weiterschauen',
      'Trending In Sports': 'Im Trend in Sport',
      'Trending Right Now': 'Derzeit im Trend',
      'Hot Right Now': 'Heiß gerade',
      'Watch In Your Language': 'In Ihrer Sprache ansehen',
    },
  };

  RxString selectedLanguage = StringConstant.english.obs;

  RxList<String> languagesList = [
    StringConstant.english,
    StringConstant.hindi,
    StringConstant.arabic,
    StringConstant.chinese,
    StringConstant.french,
    StringConstant.german,
  ].obs;

  List<String> languageShortCodes = [
    'HN',
    'EN',
    'DE',
    'ZH',
    'FR',
    'AR',
  ];
  RxList<String> languages = [
    StringConstant.hi,
    StringConstant.en,
    StringConstant.de,
    StringConstant.zh,
    StringConstant.fr,
    StringConstant.ar,
  ].obs;

  GetStorage storage = GetStorage();

  @override
  void onInit() {
    selectedLanguage.value =
        storage.read(StringConstant.languages) ?? StringConstant.english;
    super.onInit();
  }

  void saveToken(String token) {
    storage.write('login_token', token);
    print("Token Saved: $token");
  }

  String? getToken() {
    String? token = storage.read('login_token');
    print("Token Retrieved: $token");
    return token;
  }

  void deleteToken() {
    storage.remove('login_token');
    print("Token Removed");
  }

  String translate(String key) {
    return translations[selectedLanguage.value]?[key] ?? key;
  }

  void changeLanguage(String language) {
    selectedLanguage(language);
    storage.write(StringConstant.languages, language);
    update();
  }
}
