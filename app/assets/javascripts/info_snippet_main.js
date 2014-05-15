angular.module("app",['app_service'])

function nav_controller($scope, ajax_service) {
//user information probably
}
nav_controller.$inject = ['$scope', 'ajax_service']

function snippets_controller($scope, ajax_service) {
  $scope.info_snippets = {}

  ajax_service.get_all_info_snippets(function(status, data){
    $scope.info_snippets = data
  })
}
snippets_controller.$inject = ['$scope', 'ajax_service']

function tags_controller($scope, ajax_service) {
  $scope.tags = {}

  ajax_service.get_all_tags(function(status, data){
    $scope.tags = data
  })
}
snippets_controller.$inject = ['$scope', 'ajax_service']
