bioinformaticaApp.controller('programs_controller', function($scope, ajax_service, $location, communication_service) {
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

  get_programs_by_tag_id = function(tag_id){
    ajax_service.get_drugs_by_tag_id(tag_id, function(status, data){
      $scope.programs = data
      $scope.one_program = null
    })
  }

  $scope.select_drug = function(drug_id){
    communication_service.setId('drug', drug_id)
  }

  $scope.edit_drug = function(drug_id){
    communication_service.edit('programs', drug_id)
  }

  $scope.delete_drug= function(drug_id){
    communication_service.destroy('programs', drug_id)
  }

  $scope.select_company = function(company_id){
    communication_service.setId('company', company_id)
  }

  $scope.select_snippet = function(snippet_id){
    communication_service.setId('snippet', snippet_id)
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

      if( type == '/tag' ) get_programs_by_tag_id(id)
      else if( id != undefined ) get_program_by_id(id)
      else get_all_programs()
    },
    true
  )
});
