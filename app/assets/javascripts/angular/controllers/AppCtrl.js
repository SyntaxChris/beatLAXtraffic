angular.module('lawaApp')
  .controller("AppCtrl", [
    '$scope','$http', function($scope,$http) {

      $scope.currentSessionId = 'something';

      $http({
        url: '/api/respondents/get_or_create',
        method: 'GET',
        params: { session_id: $scope.currentSessionId }
        }).success(function(data){
          $scope.respondent = data;
      });
    }
  ])
