angular.module('lawaApp')
  .controller("NodeCtrl", [
    '$scope','$http','_', function($scope,$http,_) {

      $scope.setup = function(){
        $http.get('/api/nodes').success(function(data){
          $scope.nodes = data;
        })
      }

      $scope.fetchNodeById = function(){

      };

      $scope.setCurrentNodeById = function(nodeId){
        $scope.currentNode = fetchNodeById(nodeId);
      };

      $scope.setup();
    }
  ])
