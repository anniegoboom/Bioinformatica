angular.module('app_service', ['app_helpers']).
value('CONST',{
  Urls:{
      'get_all_info_snippets' : '/info_snippets',
      'get_all_tags' : '/tags',
      'snippet_by_id' : '/info_snippets/{0}',
      'tag_by_id' : '/tags/{0}',
      'snippets_by_tag_id' : '/tags/{0}/info_snippets',
      'tags_by_snippet_id' : '/info_snippets/{0}/tags',
      'tags_by_drug_id' : '/programs/{0}/tags',
      'drugs_by_tag_id' : '/tags/{0}/programs',
      'tag_type_by_id' : '/tag_types/{0}',
      'get_all_companies' : '/companies',
      'company_by_id' : '/companies/{0}',
      'get_all_programs' : '/programs',
      'program_by_id' : '/programs/{0}'
  }
}).
factory('ajax_service', ['CONST', '$http', 'url_formatter', function(CONST, $http, url_formatter){
  return {
    get_all_info_snippets: function(callback) {
      var url = CONST.Urls.get_all_info_snippets;
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_all_tags: function(callback) {
      var url = CONST.Urls.get_all_tags;
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_snippet_by_id: function(snippet_id, callback) {
      var url = url_formatter.format(CONST.Urls.snippet_by_id, snippet_id);
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_tag_by_id: function(tag_id, callback) {
      var url = url_formatter.format(CONST.Urls.tag_by_id, tag_id);
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_snippets_by_tag_id: function(tag_id, callback) {
      var url = url_formatter.format(CONST.Urls.snippets_by_tag_id, tag_id);
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_tags_by_snippet_id: function(snippet_id, callback) {
      var url = url_formatter.format(CONST.Urls.tags_by_snippet_id, snippet_id);
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_tags_by_drug_id: function(drug_id, callback) {
      var url = url_formatter.format(CONST.Urls.tags_by_drug_id, drug_id);
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_drugs_by_tag_id: function(tag_id, callback) {
      var url = url_formatter.format(CONST.Urls.drugs_by_tag_id, tag_id);
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_all_companies: function(callback) {
      var url = CONST.Urls.get_all_companies;
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_company_by_id: function(company_id, callback) {
      var url = url_formatter.format(CONST.Urls.company_by_id, company_id);
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_all_programs: function(callback) {
      var url = CONST.Urls.get_all_programs;
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    get_program_by_id: function(program_id, callback) {
      var url = url_formatter.format(CONST.Urls.program_by_id, program_id);
      $http.get(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    },

    destroy: function(type, id) {
      var url = '/'+type+'/'+id;
      $http.delete(url)
        .success(function(data, status) {
          callback(status, data);
        })
        .error(function(data, status) {
          //TODO: Show Error
        });
    }
  }
}])

.factory('communication_service', ['$location', 'ajax_service', function($location, ajax_service){
  return {
    updateURL: function(type, id) {
      if(typeof type === 'undefined') $location.path('/')
      else if(typeof id === 'undefined') $location.path(type)
      else $location.path(type+'='+id)
    },

    showAll: function(type) {
      this.updateURL(type)
    },

    setId: function(type, id) {
      this.updateURL(type, id)
    },

    edit: function(type, id) {
      window.location = '/'+type+'/'+id+'/edit'
    },

    destroy: function(type, id) {
      ajax_service.destroy(type,id)
      $location.path('/')
    }
  }
}]);
