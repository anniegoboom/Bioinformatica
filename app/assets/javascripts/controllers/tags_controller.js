function tags_controller($scope, ajax_service, communication_service) {
  $scope.tags = {}

  get_all_tags = function(){
    ajax_service.get_all_tags(function(status, data){
      $scope.tags = data
    })
  }

  // get_all_tags()

  get_tag_by_id = function(tag_id){
    ajax_service.get_tag_by_id(tag_id, function(status, data){
      $scope.tags = data
      //TODO: tell snippets controller
    })
  }

  get_tags_by_snippet_id = function(snippet_id){
    ajax_service.get_tags_by_snippet_id(snippet_id, function(status, data){
      $scope.tags = data
      //TODO: tell snippets controller
    })
  }

  $scope.select_tag = function(tag_id){
    communication_service.setTagId(tag_id)
  }

  $scope.$watch(
    function() {
      return communication_service.getSnippetId()
    },
    function(){
      snippet_id = communication_service.getSnippetId()
      if(snippet_id == null){
        get_all_tags()
      }
      else{
        get_tags_by_snippet_id(snippet_id)
      }
    },
    true
  )

  $scope.$watch(
    function() {
      return communication_service.getTagId()
    },
    function(){
      tag_id = communication_service.getTagId()
      if(tag_id == null){
        get_all_tags()
      }
      else{
        get_tag_by_id(tag_id)
      }
    },
    true
  )

}
snippets_controller.$inject = ['$scope', 'ajax_service', 'communication_service']
