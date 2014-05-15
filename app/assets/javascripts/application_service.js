angular.module('app_service', [ 'app_helpers' ]).
value('CONST',{
  Urls:{
      'get_all_info_snippets': '/info_snippets',
      'get_all_tags': '/tags',
      'snippets_by_tag': '/tags/{0}/info_snippet',
      'tag_type_by_id': '/tag_types/{0}',
      'snippet_by_id': '/info_snippet/{0}'
  }
}).
factory('ajax_service', ['CONST', '$http', 'url_formatter', function(CONST, $http, url_formatter){
  var ajax_service = {};

  ajax_service.get_all_info_snippets = function(callback){
    var url = CONST.Urls.get_all_info_snippets;
    $http.get(url)
      .success(function(data, status) {
        callback(status, data);
      })
      .error(function(data, status) {
        //TODO: Show Error
      });
  }

  ajax_service.get_all_tags = function(callback){
    var url = CONST.Urls.get_all_tags;
    $http.get(url)
      .success(function(data, status) {
        callback(status, data);
      })
      .error(function(data, status) {
        //TODO: Show Error
      });
  }

  ajax_service.snippet_by_id = function(id, callback){
    var url = url_formatter.format(CONST.Urls.snippet_by_id, id);
    $http.get(url)
      .success(function(data, status) {
        callback(status, data);
      })
      .error(function(data, status) {
        //TODO: Show Error
      });
  }

  return ajax_service;
}]);
