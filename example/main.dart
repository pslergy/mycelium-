import 'package:http/http.dart' as http;
import '../lib/core_open/transport/mycelium_transport_client_factory.dart';
import '../lib/core_open/config/transport_profile.dart';

void main() async {
  final factory = MyceliumTransportClientFactory();

  // Выбираем профиль транспорта
  final profile = TransportProfile.defaultHttp;

  // Создаём клиент
  final http.Client client = factory.createClient(profile);

  print("Using transport profile: ${profile.name}");

  try {
    // Простой тестовый запрос
    final response = await client.get(
      Uri.parse("https://example.com"),
    );

    print("Status: ${response.statusCode}");
    print("Body length: ${response.body.length}");
    print("Success! Connection working.");
  } catch (e) {
    print("Request failed: $e");
  } finally {
    client.close();
  }
}
