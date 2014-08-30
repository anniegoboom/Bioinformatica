bioinformaticaApp.controller('tags_controller', function($scope, $location, ajax_service, communication_service) {
  $scope.tags = {}
  $scope.one_tag = null

  get_all_tags = function(){
    ajax_service.get_all_tags(function(status, data){
      $scope.tags = data
      $scope.one_tag = null
    })
  }

  get_tag_by_id = function(tag_id){
    ajax_service.get_tag_by_id(tag_id, function(status, data){
      $scope.one_tag = data[0]
    })
  }

  get_tags_by_snippet_id = function(snippet_id){
    ajax_service.get_tags_by_snippet_id(snippet_id, function(status, data){
      $scope.tags = data
      $scope.one_tag = null
    })
  }

  get_tags_by_drug_id = function(drug_id){
    ajax_service.get_tags_by_drug_id(drug_id, function(status, data){
      $scope.tags = data
      $scope.one_tag = null
    })
  }

  $scope.select_tag = function(tag_id){
    communication_service.setId('tag', tag_id)
  }

  $scope.select_company = function(company_id){
    communication_service.setId('company', company_id)
  }

  $scope.edit_tag = function(tag_id){
    communication_service.edit('tags', tag_id)
  }

  $scope.delete_tag= function(tag_id){
    communication_service.destroy('tags', tag_id)
  }

  $scope.$watch(
    function(){
      return $location.path();
    },
    function(){
      urlString = $location.path().split('=')
      type = urlString[0]
      id = urlString[1]

      if( type=='/tag' && id != undefined )  get_tag_by_id(id)
      else if( type=='/drug' && id != undefined ) get_tags_by_drug_id(id)
      else if( type=='/snippet' && id != undefined ) get_tags_by_snippet_id(id)
      else get_all_tags()
    },
    true
  )
});
