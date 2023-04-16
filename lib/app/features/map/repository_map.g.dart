// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_map.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repositoryMapHash() => r'bcf24f869275451a2db31c2c524947d8e7223b93';

/// See also [repositoryMap].
@ProviderFor(repositoryMap)
final repositoryMapProvider = AutoDisposeProvider<RepositoryMap>.internal(
  repositoryMap,
  name: r'repositoryMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoryMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RepositoryMapRef = AutoDisposeProviderRef<RepositoryMap>;
String _$getRoutesListHash() => r'79ce9f6b22d6501754cb3c557578078ce2f13b54';

/// See also [getRoutesList].
@ProviderFor(getRoutesList)
final getRoutesListProvider =
    AutoDisposeFutureProvider<List<ModelRoute>>.internal(
  getRoutesList,
  name: r'getRoutesListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getRoutesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetRoutesListRef = AutoDisposeFutureProviderRef<List<ModelRoute>>;
String _$getListOfMarkersPosHash() =>
    r'bf80122098707ceb2b2cfc425209e954e6f74a44';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef GetListOfMarkersPosRef
    = AutoDisposeFutureProviderRef<ModelMarkersResponse>;

/// See also [getListOfMarkersPos].
@ProviderFor(getListOfMarkersPos)
const getListOfMarkersPosProvider = GetListOfMarkersPosFamily();

/// See also [getListOfMarkersPos].
class GetListOfMarkersPosFamily
    extends Family<AsyncValue<ModelMarkersResponse>> {
  /// See also [getListOfMarkersPos].
  const GetListOfMarkersPosFamily();

  /// See also [getListOfMarkersPos].
  GetListOfMarkersPosProvider call(
    String routeID,
  ) {
    return GetListOfMarkersPosProvider(
      routeID,
    );
  }

  @override
  GetListOfMarkersPosProvider getProviderOverride(
    covariant GetListOfMarkersPosProvider provider,
  ) {
    return call(
      provider.routeID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getListOfMarkersPosProvider';
}

/// See also [getListOfMarkersPos].
class GetListOfMarkersPosProvider
    extends AutoDisposeFutureProvider<ModelMarkersResponse> {
  /// See also [getListOfMarkersPos].
  GetListOfMarkersPosProvider(
    this.routeID,
  ) : super.internal(
          (ref) => getListOfMarkersPos(
            ref,
            routeID,
          ),
          from: getListOfMarkersPosProvider,
          name: r'getListOfMarkersPosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getListOfMarkersPosHash,
          dependencies: GetListOfMarkersPosFamily._dependencies,
          allTransitiveDependencies:
              GetListOfMarkersPosFamily._allTransitiveDependencies,
        );

  final String routeID;

  @override
  bool operator ==(Object other) {
    return other is GetListOfMarkersPosProvider && other.routeID == routeID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, routeID.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$streamMarkersPosHash() => r'6971ede0e17ef659d972d9cd4de122c335e83fed';
typedef StreamMarkersPosRef = AutoDisposeStreamProviderRef<ModelLocation>;

/// See also [streamMarkersPos].
@ProviderFor(streamMarkersPos)
const streamMarkersPosProvider = StreamMarkersPosFamily();

/// See also [streamMarkersPos].
class StreamMarkersPosFamily extends Family<AsyncValue<ModelLocation>> {
  /// See also [streamMarkersPos].
  const StreamMarkersPosFamily();

  /// See also [streamMarkersPos].
  StreamMarkersPosProvider call({
    required List<String> list,
  }) {
    return StreamMarkersPosProvider(
      list: list,
    );
  }

  @override
  StreamMarkersPosProvider getProviderOverride(
    covariant StreamMarkersPosProvider provider,
  ) {
    return call(
      list: provider.list,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'streamMarkersPosProvider';
}

/// See also [streamMarkersPos].
class StreamMarkersPosProvider
    extends AutoDisposeStreamProvider<ModelLocation> {
  /// See also [streamMarkersPos].
  StreamMarkersPosProvider({
    required this.list,
  }) : super.internal(
          (ref) => streamMarkersPos(
            ref,
            list: list,
          ),
          from: streamMarkersPosProvider,
          name: r'streamMarkersPosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$streamMarkersPosHash,
          dependencies: StreamMarkersPosFamily._dependencies,
          allTransitiveDependencies:
              StreamMarkersPosFamily._allTransitiveDependencies,
        );

  final List<String> list;

  @override
  bool operator ==(Object other) {
    return other is StreamMarkersPosProvider && other.list == list;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, list.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
