class HPApiEndpoints {
  static const String baseUrl = 'https://hp-api.onrender.com';

  static const String characters = '/api/characters';

  static characterById(String id) => '/api/character/$id';
}
