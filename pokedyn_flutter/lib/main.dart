
import 'package:flutter/material.dart';
import 'package:pokedyn_client/pokedyn_client.dart' as clientServerpod;
import 'package:pokedyn_flutter/custom_actions/login_action_handler.dart';
import 'package:pokedyn_flutter/custom_actions/logout_action_handler.dart';
import 'package:serve_dynamic_ui/serve_dynamic_ui.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';


var client = clientServerpod.Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServeDynamicUI.init(actionHandlers: {
    RegExp(r'(^/?login/?$)'): LoginActionHandler(),
    RegExp(r'(^/?logOut/?$)'): LogoutActionHandler(),
  });
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GlobalKey<NavigatorState> navigationKey;
  @override
  void initState() {
    navigationKey = GlobalKey<NavigatorState>();
    // client.example.hello('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png').then((value){
    //   print('value $value');
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ServeDynamicUIMaterialApp(
      navigatorKey: navigationKey,
      home: (context) {
        return SessionManagerWidget(
          onUndetermined: () {
            return ServeDynamicUI.fromAssets(
              'assets/json/auth_loader.json',
            );
          },
          onAuthenticated: () {
            return ServeDynamicUI.fromNetwork(
              DynamicRequest(
                url:
                'http://$localhost:8080/pokedynHomepage/getPage?isPageCacheEnabled=true',
                requestType: RequestType.get,
                sendTimeout: const Duration(seconds: 5),
                receiveTimeout: const Duration(seconds: 5),
              ),
              templateJsonPath: 'assets/json/shimmers/pokedyn_home_page_shimmer.json',
            );
          },
          deAuthenticated: () {
            return ServeDynamicUI.fromNetwork(
              DynamicRequest(
                url:
                'http://$localhost:8080/authPage/getPage?isPageCacheEnabled=true',
                requestType: RequestType.get,
                sendTimeout: const Duration(seconds: 5),
                receiveTimeout: const Duration(seconds: 5),
              ),
              templateJsonPath: 'assets/json/logout_loader.json',
            );
          },
          onAuthenticationInProgress: () {
            return ServeDynamicUI.fromAssets(
              'assets/json/loader.json',
            );
          },
          deAuthenticationInProgress: () {
            return ServeDynamicUI.fromAssets(
              'assets/json/loader.json',
            );
          },
          onAuthenticationExpired: () {
            return const SizedBox();
          },
          notAuthenticated: () {
            return ServeDynamicUI.fromNetwork(
              DynamicRequest(
                url:
                'http://$localhost:8080/authPage/getPage?isPageCacheEnabled=true',
                requestType: RequestType.get,
                sendTimeout: const Duration(seconds: 5),
                receiveTimeout: const Duration(seconds: 5),
              ),
              templateJsonPath: 'assets/json/auth_loader.json',
            );
          },
        );
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}