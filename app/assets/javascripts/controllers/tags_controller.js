function tags_controller($scope, $location, ajax_service, communication_service) {
  $scope.tags = {}
  $scope.one_tag = null

  get_all_tags = function(){
    ajax_service.get_all_tags(function(status, data){
      $scope.tags = data
      $scope.one_tag = null
    })
  }

  // get_all_tags()

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

  $scope.select_tag = function(tag_id){
    communication_service.setId('tag', tag_id)
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
      if( type=='/tag' ) tag_id = id
      if( type=='/snippet' ) snippet_id = id

      if(snippet_id == null && tag_id == null) get_all_tags()
      else if(snippet_id == null) get_tag_by_id(tag_id)
      else get_tags_by_snippet_id(snippet_id)
    },
    true
  )
}
snippets_controller.$inject = ['$scope', '$location', 'ajax_service', 'communication_service']
