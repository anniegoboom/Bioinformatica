function programs_controller($scope, ajax_service, $location, communication_service) {
  $scope.programs = {}
  $scope.one_program = null

  get_all_programs = function(){
    ajax_service.get_all_programs(function(status, data){
      $scope.programs = data
      $scope.one_program = null
    })
  }

  get_program_by_id = function(program_id){
    ajax_service.get_program_by_id(program_id, function(status, data){
      $scope.programs = null
      $scope.one_program = data[0]
    })
  }

  get_programs_by_company = function(program_id){
  }

  $scope.select_program = function(program_id){
    communication_service.setId('drug', program_id)
  }

  $scope.select_all = function(){
    communication_service.showAll('drug')
  }

  $scope.$watch(
    function(){
      return $location.path();
    },
    function(){
      urlString = $location.path().split('=')
      type = urlString[0]
      id = urlString[1]

      if( id != undefined ) get_program_by_id(id)
      else get_all_programs()
    },
    true
  )

}
programs_controller.$inject = ['$scope', 'ajax_service', '$location', 'communication_service']
