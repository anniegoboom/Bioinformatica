angular.module("app",['app_service'])

function nav_controller($scope, ajax_service, sorting_var) {
//user information probably
}
nav_controller.$inject = ['$scope', 'ajax_service']

function snippets_controller($scope, ajax_service, SortingVar) {
  $scope.info_snippets = {}

  ajax_service.get_info_snippets(function(status, data){
    $scope.info_snippets = data
  })
}
snippets_controller.$inject = ['$scope', 'ajax_service']
