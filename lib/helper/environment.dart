enum Environments {
  prod,
  dev,
}

class URls {
  String url;
  Environments env = Environments.dev; //Set environment here
  String get baseurl {
    return geturl(env);
  }

  String geturl(Environments env) {
    switch (env) {
      case Environments.dev:
        url = "";
        break;
      case Environments.prod:
        url = "";
        break;
      default:
        url = "";
    }
    return url;
  }
}
