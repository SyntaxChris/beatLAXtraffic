var lawaApp = angular.module('lawaApp', []);

lawaApp.config([
  '$httpProvider', function($httpProvider) {
    return $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);

lawaApp.run(function() {
  return console.log('angular app running');
});
