angular.module('lawaApp')
  .controller("AppCtrl", [
    '$scope','$http', function($scope,$http) {

      $scope.currentSessionId = 'something';

      $http({
        url: '/api/respondent/get_or_create',
        method: 'GET',
        params: { session_id: currentSessionId }
        }).success(function(data){
          $scope.respondent = data;
      });
    }
  ])
