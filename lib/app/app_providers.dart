import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final AWClientProvider = Provider<Client>((ref) {
  Client client = Client();
  client
      .setEndpoint('http://donjabonoso.monster/v1')
      .setProject('634cdbb2f3ef2733fff7');
  return client;
});

final AWAccountProvider = Provider<Account>((ref) {
  final AWClient = ref.watch(AWClientProvider);
  return Account(AWClient);
});

final AWDatabaseProvider = Provider<Databases>(
  (ref) {
    final AWClient = ref.watch(AWClientProvider);
    return Databases(AWClient);
  },
);

final AWRealTimeProvider = Provider<Realtime>(
  (ref) {
    final AWClient = ref.watch(AWClientProvider);
    return Realtime(AWClient);
  },
);

final locationServiceProvider = Provider<Location>(
  ((ref) {
    final location = Location();
    return location;
  }),
);
