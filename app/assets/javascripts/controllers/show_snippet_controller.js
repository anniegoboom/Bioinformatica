function snippet_show_controller($scope, ajax_service) {
  $scope.snippet = {}

  ajax_service.get_snippet_by_id(function(status, data){
    $scope.snippet = data
  })
}
snippet_show_controller.$inject = ['$scope', 'ajax_service']
