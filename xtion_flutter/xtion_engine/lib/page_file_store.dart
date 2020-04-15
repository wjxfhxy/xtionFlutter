//library xtion_engine;

class PageFileStore {

  static String _storePath = "";

  static String storePath() => _storePath;

  static init(String storePath) {

    _storePath = storePath;
  }
}