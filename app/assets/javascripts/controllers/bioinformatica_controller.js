function bioinformatica_controller($scope, ajax_service, $location, communication_service) {
$scope.type = 'company'

$scope.$watch(
    function(){
      return $location.path();
    },
    function(){
      urlString = $location.path().split('=')
      new_type = urlString[0].substr(1)
      if(new_type != '') $scope.type = new_type
    },
    true
  )

}
bioinformatica_controller.$inject = ['$scope', 'ajax_service', '$location', 'communication_service']
