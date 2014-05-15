angular.module('app_service', ['app_helpers']).
value('CONST',{
  Urls:{
      'get_all_info_snippets' : '/info_snippets',
      'get_all_tags' : '/tags',
      'snippet_by_id' : '/info_snippets/{0}',
      'tag_by_id' : '/tags/{0}',
      'snippets_by_tag_id' : '/tags/{0}/info_snippets',
      'tags_by_snippet_id' : '/info_snippets/{0}/tags',
      'tag_type_by_id' : '/tag_types/{0}'
  }
}).
factory('ajax_service', ['CONST', '$http', 'url_formatter', function(CONST, $http, url_formatter){
  var ajax_service = {}

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

  ajax_service.get_snippet_by_id = function(snippet_id, callback){
    var url = url_formatter.format(CONST.Urls.snippet_by_id, snippet_id);
    $http.get(url)
      .success(function(data, status) {
        callback(status, data);
      })
      .error(function(data, status) {
        //TODO: Show Error
      });
  }

  ajax_service.get_tag_by_id = function(tag_id, callback){
    var url = url_formatter.format(CONST.Urls.tag_by_id, tag_id);
    $http.get(url)
      .success(function(data, status) {
        callback(status, data);
      })
      .error(function(data, status) {
        //TODO: Show Error
      });
  }

  ajax_service.get_snippets_by_tag_id = function(tag_id, callback){
    var url = url_formatter.format(CONST.Urls.snippets_by_tag_id, tag_id);
    $http.get(url)
      .success(function(data, status) {
        callback(status, data);
      })
      .error(function(data, status) {
        //TODO: Show Error
      });
  }

  ajax_service.get_tags_by_snippet_id = function(snippet_id, callback){
    var url = url_formatter.format(CONST.Urls.tags_by_snippet_id, snippet_id);
    $http.get(url)
      .success(function(data, status) {
        callback(status, data);
      })
      .error(function(data, status) {
        //TODO: Show Error
      });
  }

  return ajax_service
}]).
factory('communication_service', [function(){
  var communication_service = {}

  communication_service.snippet_id = null
  communication_service.tag_id = null

  communication_service.setAll = function(){
    communication_service.snippet_id = null
    communication_service.tag_id = null
    return true
  }

  communication_service.getSnippetId = function(){
    return communication_service.snippet_id
  }

  communication_service.setSnippetId = function(id){
    if(communication_service.snippet_id != null){
      communication_service.snippet_id = null
    }
    else{
      communication_service.snippet_id = id
    }
    return communication_service.snippet_id
  }

  // communication_service.getTagId = function(){
  //   return communication_service.tag_id
  // }

  // communication_service.setTagId = function(id){
  //   communication_service.tag_id = id
  //   return communication_service.tag_id
  // }

  return communication_service
}]);
