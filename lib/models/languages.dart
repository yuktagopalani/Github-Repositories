class Languages{
  Map<String,int> _languages = {};

  Map<String, int> get languages => _languages;

  set languages(Map<String, int> value) {
    _languages = value;
  }

  Languages.fromJson(Map<String, dynamic> data){
    for(var language in data.keys){
      _languages[language] = data[language];
    }
  }
}