function nav_controller($scope, ajax_service) {
  $scope.get_all = function(){
    console.log('hi!')
  }

  $scope.get_all
}
nav_controller.$inject = ['$scope', 'ajax_service']
