bioinformaticaApp.controller('bioinformatica_controller', function($scope, ajax_service, $location, communication_service) {
$scope.type = 'company'

$scope.$watch(
    function(){
      return $location.path();
    },
    function(){
      urlString = $location.path().split('=')
      new_type = urlString[0].substr(1)
      if(new_type != '' && new_type != $scope.type ) $scope.type = new_type
    },
    true
  )
});
