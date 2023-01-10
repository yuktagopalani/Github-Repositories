class Repo{
  String _name = '';
  bool _private = false;
  String _description = '';
  bool _fork = false;
  String _url = '';
  String _languages_url = '';
  String _forks_url = '';
  int _stargazers_count = 0;
  int _forks = 0;
  int _open_issues = 0;
  int _watchers = 0;
  String _updated_at = '';
  String _language = '';        // Major Language
  String _svn_url = '';         // if forked, owners url
  List<dynamic> _topics = [];
  String _license = '';

  Repo.ForNull();

  Repo.name(
      this._name,
      this._private,
      this._description,
      this._fork,
      this._url,
      this._languages_url,
      this._forks_url,
      this._stargazers_count,
      this._forks,
      this._open_issues,
      this._watchers,
      this._updated_at,
      this._language,
      this._svn_url,
      this._topics,
      this._license);

  String get license => _license;

  List<dynamic> get topics => _topics;

  String get svn_url => _svn_url;

  String get updated_at => _updated_at;

  int get watchers => _watchers;

  int get open_issues => _open_issues;

  int get forks => _forks;

  int get stargazers_count => _stargazers_count;

  String get forks_url => _forks_url;

  String get languages_url => _languages_url;

  String get url => _url;

  bool get fork => _fork;

  String get description => _description;

  bool get private => _private;

  String get name => _name;

  String get language => _language;

  set license(String value) {
    _license = value;
  }

  set topics(List<dynamic> value) {
    _topics = value;
  }

  set svn_url(String value) {
    _svn_url = value;
  }

  set language(String value) {
    _language = value;
  }

  set updated_at(String value) {
    _updated_at = value;
  }

  set watchers(int value) {
    _watchers = value;
  }

  set open_issues(int value) {
    _open_issues = value;
  }

  set forks(int value) {
    _forks = value;
  }

  set stargazers_count(int value) {
    _stargazers_count = value;
  }

  set forks_url(String value) {
    _forks_url = value;
  }

  set languages_url(String value) {
    _languages_url = value;
  }

  set url(String value) {
    _url = value;
  }

  set fork(bool value) {
    _fork = value;
  }

  set description(String value) {
    _description = value;
  }

  set private(bool value) {
    _private = value;
  }

  set name(String value) {
    _name = value;
  }


  Repo.fromJson(Map<String, dynamic> data){
    _name = data['name'] ?? '';
    _private = data['private'] ?? false;
    _description = data['description'] ?? '';
    _fork = data['fork'] ?? false;
    _url = data['url'] ?? '';
    _languages_url = data['languages_url'] ?? '';
    _forks_url = data['forks_url'] ?? '';
    _stargazers_count = data['stargazers_count'] ?? 0;
    _forks = data['forks'] ?? 0;
    _open_issues = data['open_issues'] ?? 0;
    _watchers = data['watchers'] ?? 0;
    _updated_at = data['updated_at'] ?? '';
    _language = data['language'] ?? '';        // Major Language
    _svn_url = data['svn_url'] ?? '';         // if forked, owners url
    _topics =  data['topics'] ?? [];
    if(data['license']){
      _license = data['license']['spdx_id'] ?? '';
    }
  }
}