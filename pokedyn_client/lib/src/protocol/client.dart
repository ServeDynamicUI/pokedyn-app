/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'protocol.dart' as _i3;

/// {@category Endpoint}
class EndpointAuthPage extends _i1.EndpointRef {
  EndpointAuthPage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'authPage';

  _i2.Future<Map<String, dynamic>> getPage() =>
      caller.callServerEndpoint<Map<String, dynamic>>(
        'authPage',
        'getPage',
        {},
      );
}

/// {@category Endpoint}
class EndpointPokedynHomepage extends _i1.EndpointRef {
  EndpointPokedynHomepage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'pokedynHomepage';

  _i2.Future<String> getPage() => caller.callServerEndpoint<String>(
        'pokedynHomepage',
        'getPage',
        {},
      );
}

/// {@category Endpoint}
class EndpointPokemonDetailPage extends _i1.EndpointRef {
  EndpointPokemonDetailPage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'pokemonDetailPage';

  _i2.Future<String> getPage() => caller.callServerEndpoint<String>(
        'pokemonDetailPage',
        'getPage',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i3.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    authPage = EndpointAuthPage(this);
    pokedynHomepage = EndpointPokedynHomepage(this);
    pokemonDetailPage = EndpointPokemonDetailPage(this);
  }

  late final EndpointAuthPage authPage;

  late final EndpointPokedynHomepage pokedynHomepage;

  late final EndpointPokemonDetailPage pokemonDetailPage;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'authPage': authPage,
        'pokedynHomepage': pokedynHomepage,
        'pokemonDetailPage': pokemonDetailPage,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
