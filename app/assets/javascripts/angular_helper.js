angular.module('app_helpers', []).
service('url_formatter',
  [function(){
    this.format = function() {
        var url_string = arguments[0];

        for (var i = 0; i < arguments.length - 1; i++) {
          var reg = new RegExp("\\{" + i + "\\}", "gm");
          url_string = url_string.replace(reg, arguments[i + 1]);
        }

        return url_string;
    }
  }]
).
directive('ngConfirmClick', [
  function(){
    return {
      priority: -1,
      restrict: 'A',
      link: function(scope, element, attrs){
        element.bind('click', function(e){
          var message = attrs.ngConfirmClick;
          if(message && !confirm(message)){
            e.stopImmediatePropagation();
            e.preventDefault();
          }
        });
      }
    }
  }
]);
