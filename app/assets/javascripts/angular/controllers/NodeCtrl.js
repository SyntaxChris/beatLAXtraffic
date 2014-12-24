angular.module('lawaApp')
  .controller("NodeCtrl", [
    '$scope','$http', function($scope,$http) {

      $scope.setup = function(){
        console.log("this: " );
        $http.get('/api/nodes').success(function(data){
          $scope.nodes = data;
        })
      }

      $scope.setup();
    }
  ])
