angular.module('app_service', [ ]).
value('CONST',{
  Urls:{
      'get_info_snippets': '/info_snippets',
      'get_tags': '/tags',
      'snippets_by_tag': '/tags/{0}/info_snippet'
  }
}).
factory('application_service', ['CONST', '$http', function(CONST, $http){
  var application_service = { };

  //helper method for formatting the url. this is usually part of a different JS class that's shared among all the other applications
  var format = function() {
      var s = arguments[0];
      for (var i = 0; i < arguments.length - 1; i++) {
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        s = s.replace(reg, arguments[i + 1]);
      }

      return s;
  }

  application_service.get_info_snippets = function(callback){
    var url = CONST.Urls.get_info_snippets;
    $http.get(url)
      .success(function(data, status) {
        callback(status, data);
      })
      .error(function(data, status) {
        //TODO: Show Error
      });
  }

  return application_service;
}]);
