function tags_controller($scope, ajax_service) {
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

  get_tags_by_snippet_id(1)
}
snippets_controller.$inject = ['$scope', 'ajax_service']
