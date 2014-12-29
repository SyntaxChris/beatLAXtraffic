angular.module('lawaApp')
  .controller("NodeCtrl", [
    '$scope','$http', function($scope,$http) {

      $scope.setup = function(){
        $http.get('/api/nodes').success(function(data){
          $scope.nodes = data;
          console.log(data);
        })
      }

      $scope.setup();
    }
  ])
