function tags_controller($scope, ajax_service) {
  $scope.tags = {}

  ajax_service.get_all_tags(function(status, data){
    $scope.tags = data
  })
}
snippets_controller.$inject = ['$scope', 'ajax_service']
