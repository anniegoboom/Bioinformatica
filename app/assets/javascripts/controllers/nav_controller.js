function nav_controller($scope, ajax_service, communication_service) {
  $scope.show_all_conversations_and_tags = function(){
    communication_service.showAll('snippet')
  }

  $scope.show_all_companies = function(){
    communication_service.showAll('company')
  }

  $scope.show_all_programs = function(){
    communication_service.showAll('drug')
  }
}
nav_controller.$inject = ['$scope', 'ajax_service', 'communication_service']
