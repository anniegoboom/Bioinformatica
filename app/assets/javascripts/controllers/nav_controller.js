function nav_controller($scope, ajax_service, communication_service) {
  $scope.show_all_conversations_and_tags = function(){
    communication_service.showAllSnippets()
  }

  $scope.show_all_companies = function(){
    communication_service.showAllCompanies()
  }

  $scope.show_all_programs = function(){
    communication_service.showAllDrugs()
  }
}
nav_controller.$inject = ['$scope', 'ajax_service', 'communication_service']
