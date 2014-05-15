function nav_controller($scope, ajax_service, communication_service) {
  $scope.set_all = function(){
    communication_service.setAll
  }
}
nav_controller.$inject = ['$scope', 'ajax_service', 'communication_service']
