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
      $scope.one_program = data
    })
  }

  get_programs_by_company = function(program_id){
  }

  $scope.select_program = function(program_id){
    communication_service.setId('program', program_id)
  }

  $scope.select_all = function(){
    communication_service.showAll('program')
  }

  $scope.$watch(
    function(){
      return $location.path();
    },
    function(){
      tag_id = null
      snippet_id = null
      urlString = $location.path().split('=')
      type = urlString[0]
      id = urlString[1]

      program_id = id
      if(program_id != undefined) get_program_by_id(program_id)
      else get_all_programs()
    },
    true
  )


}
company_controller.$inject = ['$scope', 'ajax_service', '$location', 'communication_service']
