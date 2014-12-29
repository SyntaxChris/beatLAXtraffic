angular.module('lawaApp')
  .controller("NodeCtrl", [
    '$scope','$http','_', function($scope,$http,_) {

      $scope.setup = function(){
        $http.get('/api/nodes').success(function(data){
          $scope.nodes = data;

          // TODO:
          // the setup function will need a way to set the currentNode as the first
          // node in the experience if session is new, otherwise set it to current player's
          // session current node. but for now, we'll go with:
          $scope.currentNode = $scope.fetchNodeById(1);
          // also, should the API do that an should this js function not be responsible for that?
          // ...yes, i think so. something in the API like:
          // `starting_node = 1 || current_session.current_node_id`
          // ... and then this controller should just look to starting_node
        })
      }

      $scope.fetchNodeById = function(nodeId){
        var currentNode = _.where($scope.nodes, {node_id: nodeId})
        return currentNode[0];
      };

      $scope.setCurrentNodeById = function(nodeId){
        $scope.currentNode = $scope.fetchNodeById(nodeId);
      };

      $scope.setCurrentDecisionDestination = function(destinationId){
        $scope.currentDecisionDestination = $scope.fetchNodeById(destinationId);
      }

      $scope.goToNextNode = function(){
        if(!$scope.currentNode.is_decision_point){
          // go to next node based on current Q's destination
          var destinationNodeId = $scope.currentNode.destination_node_id;
        } else if($scope.currentNode.is_decision_point){
          // go to node based on decision
          var destinationNodeId = $scope.currentDecisionDestination.node_id;
        }

        $scope.setCurrentNodeById(destinationNodeId);
      }

      $scope.submit = function(){
        // post to API and then on success:
        $scope.goToNextNode();
        // TODO: clear decision
      }

      $scope.setup();
    }
  ])
