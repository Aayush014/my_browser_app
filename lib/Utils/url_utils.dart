String getDomainName(String url) {
  final uri = Uri.parse(url);
  return uri.host;
}
