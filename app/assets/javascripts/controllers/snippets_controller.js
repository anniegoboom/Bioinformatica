bioinformaticaApp.controller('snippets_controller', function($scope, $location, ajax_service, communication_service) {
  $scope.info_snippets = {}
  $scope.showing_one_snippet = false

  get_all_snippets = function(){
    ajax_service.get_all_info_snippets(function(status, data){
      $scope.info_snippets = data
      $scope.showing_one_snippet = false
    })
  }

  get_snippet_by_id = function(snippet_id){
    ajax_service.get_snippet_by_id(snippet_id, function(status, data){
      $scope.info_snippets = data
      $scope.showing_one_snippet = true
    })
  }

  get_snippets_by_tag_id = function(tag_id){
    ajax_service.get_snippets_by_tag_id(tag_id, function(status, data){
      $scope.info_snippets = data
    })
  }

  $scope.select_snippet = function(snippet_id){
    communication_service.setId('snippet', snippet_id)
  }

  $scope.edit_snippet = function(snippet_id){
    communication_service.edit('info_snippets', snippet_id)
  }

  $scope.delete_snippet = function(snippet_id){
    communication_service.destroy('info_snippets', snippet_id)
  }

  $scope.select_company = function(company_id){
    communication_service.setId('company', company_id)
  }

  $scope.select_drug = function(drug_id){
    communication_service.setId('drug', drug_id)
  }

  $scope.$watch(
    function(){
      return $location.path();
    },
    function(){
      urlString = $location.path().split('=')
      type = urlString[0]
      id = urlString[1]

      if( type == '/tag' ) get_snippets_by_tag_id(id)
      else if( id != undefined ) get_snippet_by_id(id)
      else get_all_snippets()
    },
    true
  )
});
