function snippets_controller($scope, ajax_service) {
  $scope.info_snippets = {}

  ajax_service.get_all_info_snippets(function(status, data){
    $scope.info_snippets = data
  })
}
snippets_controller.$inject = ['$scope', 'ajax_service']
