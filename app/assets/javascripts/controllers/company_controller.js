bioinformaticaApp.controller('company_controller', function($scope, ajax_service, $location, communication_service) {
  $scope.companies = {}
  $scope.one_company = null

  get_all_companies = function(){
    ajax_service.get_all_companies(function(status, data){
      $scope.companies = data
      $scope.one_company = null
    })
  }

  get_company_by_id = function(company_id){
    ajax_service.get_company_by_id(company_id, function(status, data){
      $scope.companies = null
      $scope.one_company = data[0]
    })
  }

  $scope.select_company = function(company_id){
    communication_service.setId('company', company_id)
  }

  $scope.select_program = function(program_id){
    communication_service.setId('drug', program_id)
  }

  $scope.select_all = function(){
    communication_service.showAll('company')
  }

  $scope.select_snippet = function(snippet_id){
    communication_service.setId('snippet', snippet_id)
  }

  $scope.select_tag = function(tag_id){
    communication_service.setId('tag', tag_id)
  }

  $scope.edit_company = function(company_id){
    communication_service.edit('companies', company_id)
  }

  $scope.delete_company = function(company_id){
    communication_service.destroy('companies', company_id)
  }

  $scope.$watch(
    function(){
      return $location.path();
    },
    function(){
      urlString = $location.path().split('=')
      type = urlString[0]
      id = urlString[1]

      //check to make sure it's even for companies
      if( id != undefined ) get_company_by_id(id)
      else get_all_companies()
    },
    true
  )
});
