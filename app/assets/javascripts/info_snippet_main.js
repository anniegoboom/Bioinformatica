angular.module("app",['app_service'])

function nav_controller($scope, application_service, sorting_var) {
//user information probably
}
nav_controller.$inject = ['$scope', 'application_service']

function body_controller($scope, application_service, SortingVar) {
  $scope.info_snippets = {}

  application_service.get_info_snippets(function(status, data){
    $scope.info_snippets = data
  })
}
body_controller.$inject = ['$scope', 'application_service']
