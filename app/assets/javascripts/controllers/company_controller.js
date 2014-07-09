function company_controller($scope, ajax_service, $location, communication_service) {
  $scope.companies = {}
  $scope.one_company = true

  get_all_companies = function(){
    ajax_service.get_all_info_snippets(function(status, data){
      $scope.companies = data
      $scope.company = false
    })
  }

  get_company_by_id = function(company_id){
    ajax_service.get_company_by_id(company_id, function(status, data){
      $scope.companies = data
      $scope.single_company = true
    })
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
      if(type=='/company'){
        company_id = id
        if(company_id != undefined) get_company_by_id(company_id)
        else get_all_companies()
      }
    },
    true
  )


}
company_controller.$inject = ['$scope', 'ajax_service', '$location', 'communication_service']
