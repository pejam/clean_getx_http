class ApiConfig {
  ApiConfig();

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImFkbWluQGFkbWluLmNvbSIsIkVDUy1Db250ZXh0Ijp7IklkIjozMiwiQWRtaW5OYW1lIjoiYWRtaW5AYWRtaW4uY29tIiwiUGVyc29uRmlyc3ROYW1lIjpudWxsLCJQZXJzb25MYXN0TmFtZSI6bnVsbCwiQ29ubmVjdGlvbiI6Ino2c3lhd1l1dHIvc2lRak92a3kyeWJYVDNkVkJQOVNWd25vOVFiSnpqTjBjT3RMVU01aklCdWp1ZUNnODAzSmxhNi9lTXhLcmZrTGpaV1A5NEZaRGdZdi8rN3VpSEQvV3FXVU9NVWlkQlFCN1Ezam40MXBWRHdHbmUzcm5wV1RUWmM5ckFMaS9zVzF2OVlXcDkxRVlQc2ZJc01xWjdqdFNNbGV4UlNEdDB6aEloWFZUYzIzNXdaNmRVWVp3aVU3dTI1ODZWS3drdlNiNlpuMy82WCtmMm5kQnoxTDhaODQxdjFzK21zUTFXdTZVOFBGSHM4YU1BemQxbXQweXZpZlUiLCJMYXN0TG9naW5EYXRlIjoiMjAyMy0wMi0xNlQxMzo0NDoxNC42MTEzMDI2IiwiTGFuZ3VhZ2UiOiJlbiIsIlJvbGVzIjpbXSwiUGVybWlzc2lvbnMiOltdfSwibmJmIjoxNjc2NTU5MzE3LCJleHAiOjE2NzcxNjQxMTcsImlhdCI6MTY3NjU1OTMxNywiaXNzIjoidGFkYmlyLWFwaSIsImF1ZCI6ImRhc2hib2FyZC1hcHAifQ.wppKJadtyt6i6oQYUaewANRcLvrmBmlrayqkPvhZcH4";
  String baseUrl = 'https://fakestoreapi.com';
  int receiveTimeout = 30;
  int connectionTimeout = 30;

  static const String product = '/products';
}