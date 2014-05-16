function snippets_controller($scope, ajax_service, communication_service) {
  $scope.info_snippets = {}

  get_all_snippets = function(){
    ajax_service.get_all_info_snippets(function(status, data){
      $scope.info_snippets = data
    })
  }

  get_snippet_by_id = function(snippet_id){
    ajax_service.get_snippet_by_id(snippet_id, function(status, data){
      $scope.info_snippets = data
    })
  }

  get_snippets_by_tag_id = function(tag_id){
    ajax_service.get_snippets_by_tag_id(tag_id, function(status, data){
      $scope.info_snippets = data
    })
  }

  $scope.select_snippet = function(snippet_id){
    communication_service.setSnippetId(snippet_id)
  }

  $scope.$watch(
    function() {
      return communication_service.hasSomethingChanged()
    },
    function(){
      snippet_id = communication_service.getSnippetId()
      tag_id = communication_service.getTagId()
      if(snippet_id == null && tag_id == null){
        get_all_snippets()
      }
      else if(tag_id == null){
        get_snippet_by_id(snippet_id)
      }
      else{
        get_snippets_by_tag_id(tag_id)
      }
    },
    true
  )
}
snippets_controller.$inject = ['$scope', 'ajaxService', 'communication_service']
