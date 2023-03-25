// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$repositoryAuthHash() => r'82ec66bc9cf8f1262802d3be29e3428c07686ae2';

/// See also [repositoryAuth].
@ProviderFor(repositoryAuth)
final repositoryAuthProvider = AutoDisposeProvider<RepositoryAuth>.internal(
  repositoryAuth,
  name: r'repositoryAuthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$repositoryAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RepositoryAuthRef = AutoDisposeProviderRef<RepositoryAuth>;
String _$oAuth2SessionHash() => r'294495fc739dec7094b16518e1493eb3ac6f556f';

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

typedef OAuth2SessionRef = AutoDisposeFutureProviderRef<bool>;

/// See also [oAuth2Session].
@ProviderFor(oAuth2Session)
const oAuth2SessionProvider = OAuth2SessionFamily();

/// See also [oAuth2Session].
class OAuth2SessionFamily extends Family<AsyncValue<bool>> {
  /// See also [oAuth2Session].
  const OAuth2SessionFamily();

  /// See also [oAuth2Session].
  OAuth2SessionProvider call({
    required String provider,
  }) {
    return OAuth2SessionProvider(
      provider: provider,
    );
  }

  @override
  OAuth2SessionProvider getProviderOverride(
    covariant OAuth2SessionProvider provider,
  ) {
    return call(
      provider: provider.provider,
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
  String? get name => r'oAuth2SessionProvider';
}

/// See also [oAuth2Session].
class OAuth2SessionProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [oAuth2Session].
  OAuth2SessionProvider({
    required this.provider,
  }) : super.internal(
          (ref) => oAuth2Session(
            ref,
            provider: provider,
          ),
          from: oAuth2SessionProvider,
          name: r'oAuth2SessionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$oAuth2SessionHash,
          dependencies: OAuth2SessionFamily._dependencies,
          allTransitiveDependencies:
              OAuth2SessionFamily._allTransitiveDependencies,
        );

  final String provider;

  @override
  bool operator ==(Object other) {
    return other is OAuth2SessionProvider && other.provider == provider;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, provider.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
