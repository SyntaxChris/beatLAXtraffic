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
        });
        $scope.currentDecisionDestination = null;
        $scope.currentAnswers = [];
      }

      $scope.fetchNodeById = function(nodeId){
        var currentNode = _.where($scope.nodes, {node_id: nodeId})
        return currentNode[0];
      };

      $scope.setCurrentNodeById = function(nodeId){
        $scope.currentNode = $scope.fetchNodeById(nodeId);
      };

      $scope.setCurrentDecision = function(decision){
        $scope.currentDecisionDestination = $scope.fetchNodeById(decision.destination_node_id);
        $scope.submit(decision.id);
      };

      $scope.addAnswerToCurrentAnswers = function(answer){
        // TODO: This will probably be replaced by some sort of collection coming from jQuery
        if (_.findWhere($scope.currentAnswers, answer)){
          // answer is already in current list, remove it.
          $scope.currentAnswers = _.without($scope.currentAnswers, _.findWhere($scope.currentAnswers, answer));
        } else {
          $scope.currentAnswers.push(answer);
        }
      };

      $scope.goToNextNode = function(){
        if(!$scope.currentNode.is_decision_point){
          // go to next node based on current Q's destination
          var destinationNodeId = $scope.currentNode.next_node_id;
        }else if($scope.currentNode.is_decision_point){
          // go to node based on decision
          var destinationNodeId = $scope.currentDecisionDestination.node_id;
        }

        $scope.setCurrentNodeById(destinationNodeId);
      };

      $scope.submit = function(decisionId){
        var params = {
          is_decision: $scope.currentNode.is_decision_point,
          respondent_id: 1,
          node_id: $scope.currentNode.node_id,
          decision_id: decisionId || null,
          answers: $scope.currentAnswers
        }
        $http.post('/api/nodes').success(function(data){
        // post to API and then on success:
        $scope.goToNextNode();

        // TODO: clear decision
        $scope.currentDecisionDestination = null;
        // TODO: clear answers
        $scope.currentAnswers = [];
      };

      $scope.setup();
    }
  ])
