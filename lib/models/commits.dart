class Commits {
  Commits({
      String? sha, 
      String? nodeId, 
      Commit? commit, 
      String? url, 
      String? htmlUrl, 
      String? commentsUrl, 
      Author? author,}){
    _sha = sha;
    _nodeId = nodeId;
    _commit = commit;
    _url = url;
    _htmlUrl = htmlUrl;
    _commentsUrl = commentsUrl;
    _author = author;
}

  Commits.fromJson(dynamic json) {
    _sha = json['sha'];
    _nodeId = json['node_id'];
    _commit = json['commit'] != null ? Commit.fromJson(json['commit']) : null;
    _url = json['url'];
    _htmlUrl = json['html_url'];
    _commentsUrl = json['comments_url'];
    _author = json['author'] != null ? Author.fromJson(json['author']) : null;
  }
  String? _sha;
  String? _nodeId;
  Commit? _commit;
  String? _url;
  String? _htmlUrl;
  String? _commentsUrl;
  Author? _author;
Commits copyWith({  String? sha,
  String? nodeId,
  Commit? commit,
  String? url,
  String? htmlUrl,
  String? commentsUrl,
  Author? author,
}) => Commits(  sha: sha ?? _sha,
  nodeId: nodeId ?? _nodeId,
  commit: commit ?? _commit,
  url: url ?? _url,
  htmlUrl: htmlUrl ?? _htmlUrl,
  commentsUrl: commentsUrl ?? _commentsUrl,
  author: author ?? _author,
);
  String? get sha => _sha;
  String? get nodeId => _nodeId;
  Commit? get commit => _commit;
  String? get url => _url;
  String? get htmlUrl => _htmlUrl;
  String? get commentsUrl => _commentsUrl;
  Author? get author => _author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sha'] = _sha;
    map['node_id'] = _nodeId;
    if (_commit != null) {
      map['commit'] = _commit?.toJson();
    }
    map['url'] = _url;
    map['html_url'] = _htmlUrl;
    map['comments_url'] = _commentsUrl;
    if (_author != null) {
      map['author'] = _author?.toJson();
    }
    return map;
  }

}

class Author {
  Author({
      String? login, 
      num? id, 
      String? nodeId, 
      String? avatarUrl, 
      String? gravatarId, 
      String? url, 
      String? htmlUrl, 
      String? followersUrl, 
      String? followingUrl, 
      String? gistsUrl, 
      String? starredUrl, 
      String? subscriptionsUrl, 
      String? organizationsUrl, 
      String? reposUrl, 
      String? eventsUrl, 
      String? receivedEventsUrl, 
      String? type, 
      bool? siteAdmin,}){
    _login = login;
    _id = id;
    _nodeId = nodeId;
    _avatarUrl = avatarUrl;
    _gravatarId = gravatarId;
    _url = url;
    _htmlUrl = htmlUrl;
    _followersUrl = followersUrl;
    _followingUrl = followingUrl;
    _gistsUrl = gistsUrl;
    _starredUrl = starredUrl;
    _subscriptionsUrl = subscriptionsUrl;
    _organizationsUrl = organizationsUrl;
    _reposUrl = reposUrl;
    _eventsUrl = eventsUrl;
    _receivedEventsUrl = receivedEventsUrl;
    _type = type;
    _siteAdmin = siteAdmin;
}

  Author.fromJson(dynamic json) {
    _login = json['login'];
    _id = json['id'];
    _nodeId = json['node_id'];
    _avatarUrl = json['avatar_url'];
    _gravatarId = json['gravatar_id'];
    _url = json['url'];
    _htmlUrl = json['html_url'];
    _followersUrl = json['followers_url'];
    _followingUrl = json['following_url'];
    _gistsUrl = json['gists_url'];
    _starredUrl = json['starred_url'];
    _subscriptionsUrl = json['subscriptions_url'];
    _organizationsUrl = json['organizations_url'];
    _reposUrl = json['repos_url'];
    _eventsUrl = json['events_url'];
    _receivedEventsUrl = json['received_events_url'];
    _type = json['type'];
    _siteAdmin = json['site_admin'];
  }
  String? _login;
  num? _id;
  String? _nodeId;
  String? _avatarUrl;
  String? _gravatarId;
  String? _url;
  String? _htmlUrl;
  String? _followersUrl;
  String? _followingUrl;
  String? _gistsUrl;
  String? _starredUrl;
  String? _subscriptionsUrl;
  String? _organizationsUrl;
  String? _reposUrl;
  String? _eventsUrl;
  String? _receivedEventsUrl;
  String? _type;
  bool? _siteAdmin;
Author copyWith({  String? login,
  num? id,
  String? nodeId,
  String? avatarUrl,
  String? gravatarId,
  String? url,
  String? htmlUrl,
  String? followersUrl,
  String? followingUrl,
  String? gistsUrl,
  String? starredUrl,
  String? subscriptionsUrl,
  String? organizationsUrl,
  String? reposUrl,
  String? eventsUrl,
  String? receivedEventsUrl,
  String? type,
  bool? siteAdmin,
}) => Author(  login: login ?? _login,
  id: id ?? _id,
  nodeId: nodeId ?? _nodeId,
  avatarUrl: avatarUrl ?? _avatarUrl,
  gravatarId: gravatarId ?? _gravatarId,
  url: url ?? _url,
  htmlUrl: htmlUrl ?? _htmlUrl,
  followersUrl: followersUrl ?? _followersUrl,
  followingUrl: followingUrl ?? _followingUrl,
  gistsUrl: gistsUrl ?? _gistsUrl,
  starredUrl: starredUrl ?? _starredUrl,
  subscriptionsUrl: subscriptionsUrl ?? _subscriptionsUrl,
  organizationsUrl: organizationsUrl ?? _organizationsUrl,
  reposUrl: reposUrl ?? _reposUrl,
  eventsUrl: eventsUrl ?? _eventsUrl,
  receivedEventsUrl: receivedEventsUrl ?? _receivedEventsUrl,
  type: type ?? _type,
  siteAdmin: siteAdmin ?? _siteAdmin,
);
  String? get login => _login;
  num? get id => _id;
  String? get nodeId => _nodeId;
  String? get avatarUrl => _avatarUrl;
  String? get gravatarId => _gravatarId;
  String? get url => _url;
  String? get htmlUrl => _htmlUrl;
  String? get followersUrl => _followersUrl;
  String? get followingUrl => _followingUrl;
  String? get gistsUrl => _gistsUrl;
  String? get starredUrl => _starredUrl;
  String? get subscriptionsUrl => _subscriptionsUrl;
  String? get organizationsUrl => _organizationsUrl;
  String? get reposUrl => _reposUrl;
  String? get eventsUrl => _eventsUrl;
  String? get receivedEventsUrl => _receivedEventsUrl;
  String? get type => _type;
  bool? get siteAdmin => _siteAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    map['id'] = _id;
    map['node_id'] = _nodeId;
    map['avatar_url'] = _avatarUrl;
    map['gravatar_id'] = _gravatarId;
    map['url'] = _url;
    map['html_url'] = _htmlUrl;
    map['followers_url'] = _followersUrl;
    map['following_url'] = _followingUrl;
    map['gists_url'] = _gistsUrl;
    map['starred_url'] = _starredUrl;
    map['subscriptions_url'] = _subscriptionsUrl;
    map['organizations_url'] = _organizationsUrl;
    map['repos_url'] = _reposUrl;
    map['events_url'] = _eventsUrl;
    map['received_events_url'] = _receivedEventsUrl;
    map['type'] = _type;
    map['site_admin'] = _siteAdmin;
    return map;
  }

}

class Commit {
  Commit({
      Owner? owner, 
      String? message, 
      String? url, 
      num? commentCount, 
      Verification? verification,}){
    _owner = owner;
    _message = message;
    _url = url;
    _commentCount = commentCount;
    _verification = verification;
}

  Commit.fromJson(dynamic json) {
    _owner = json['owner'] != null ? Owner.fromJson(json['author']) : null;
    _message = json['message'];
    _url = json['url'];
    _commentCount = json['comment_count'];
    _verification = json['verification'] != null ? Verification.fromJson(json['verification']) : null;
  }
  Owner? _owner;
  String? _message;
  String? _url;
  num? _commentCount;
  Verification? _verification;
Commit copyWith({  Owner? owner,
  String? message,
  String? url,
  num? commentCount,
  Verification? verification,
}) => Commit(  owner: owner ?? _owner,
  message: message ?? _message,
  url: url ?? _url,
  commentCount: commentCount ?? _commentCount,
  verification: verification ?? _verification,
);
  Owner? get owner => _owner;
  String? get message => _message;
  String? get url => _url;
  num? get commentCount => _commentCount;
  Verification? get verification => _verification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_owner != null) {
      map['author'] = _owner?.toJson();
    }
    map['message'] = _message;
    map['url'] = _url;
    map['comment_count'] = _commentCount;
    if (_verification != null) {
      map['verification'] = _verification?.toJson();
    }
    return map;
  }

}

class Verification {
  Verification({
      bool? verified, 
      String? reason, 
      String? signature, 
      String? payload,}){
    _verified = verified;
    _reason = reason;
    _signature = signature;
    _payload = payload;
}

  Verification.fromJson(dynamic json) {
    _verified = json['verified'];
    _reason = json['reason'];
    _signature = json['signature'];
    _payload = json['payload'];
  }
  bool? _verified;
  String? _reason;
  String? _signature;
  String? _payload;
Verification copyWith({  bool? verified,
  String? reason,
  String? signature,
  String? payload,
}) => Verification(  verified: verified ?? _verified,
  reason: reason ?? _reason,
  signature: signature ?? _signature,
  payload: payload ?? _payload,
);
  bool? get verified => _verified;
  String? get reason => _reason;
  String? get signature => _signature;
  String? get payload => _payload;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['verified'] = _verified;
    map['reason'] = _reason;
    map['signature'] = _signature;
    map['payload'] = _payload;
    return map;
  }

}

class Owner {
  Owner({
      String? name, 
      String? email, 
      String? date,}){
    _name = name;
    _email = email;
    _date = date;
}

  Owner.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _date = json['date'];
  }
  String? _name;
  String? _email;
  String? _date;
Owner copyWith({  String? name,
  String? email,
  String? date,
}) => Owner(  name: name ?? _name,
  email: email ?? _email,
  date: date ?? _date,
);
  String? get name => _name;
  String? get email => _email;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['date'] = _date;
    return map;
  }

}