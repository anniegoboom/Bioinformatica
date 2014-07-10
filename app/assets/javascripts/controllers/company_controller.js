function company_controller($scope, ajax_service, $location, communication_service) {
  $scope.companies = {}
  $scope.one_company = null

  $scope.get_all_companies = function(){
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

      company_id = id
      if(company_id != undefined) get_company_by_id(company_id)
      else $scope.get_all_companies()
    },
    true
  )


}
company_controller.$inject = ['$scope', 'ajax_service', '$location', 'communication_service']
