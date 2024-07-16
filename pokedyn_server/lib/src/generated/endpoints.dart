/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/authpage_endpoint.dart' as _i2;
import '../endpoints/pokedyn_homepage_endpoint.dart' as _i3;
import '../endpoints/pokemon_detail_page_endpoint.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'authPage': _i2.AuthPageEndpoint()
        ..initialize(
          server,
          'authPage',
          null,
        ),
      'pokedynHomepage': _i3.PokedynHomepageEndpoint()
        ..initialize(
          server,
          'pokedynHomepage',
          null,
        ),
      'pokemonDetailPage': _i4.PokemonDetailPageEndpoint()
        ..initialize(
          server,
          'pokemonDetailPage',
          null,
        ),
    };
    connectors['authPage'] = _i1.EndpointConnector(
      name: 'authPage',
      endpoint: endpoints['authPage']!,
      methodConnectors: {
        'getPage': _i1.MethodConnector(
          name: 'getPage',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['authPage'] as _i2.AuthPageEndpoint).getPage(session),
        )
      },
    );
    connectors['pokedynHomepage'] = _i1.EndpointConnector(
      name: 'pokedynHomepage',
      endpoint: endpoints['pokedynHomepage']!,
      methodConnectors: {
        'getPage': _i1.MethodConnector(
          name: 'getPage',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['pokedynHomepage'] as _i3.PokedynHomepageEndpoint)
                  .getPage(session),
        )
      },
    );
    connectors['pokemonDetailPage'] = _i1.EndpointConnector(
      name: 'pokemonDetailPage',
      endpoint: endpoints['pokemonDetailPage']!,
      methodConnectors: {
        'getPage': _i1.MethodConnector(
          name: 'getPage',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['pokemonDetailPage'] as _i4.PokemonDetailPageEndpoint)
                  .getPage(session),
        )
      },
    );
  }
}
