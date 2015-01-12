angular.module('lawaApp')
  .controller("NodeCtrl", [
    '$scope','$http','_', function($scope,$http,_) {

      $scope.setup = function(){
        // get and set up all nodes
        $http.get('/api/nodes').success(function(data){
          $scope.nodes = data;
        });

        // find or create a respondent with session and current node data
        $http.get('/api/respondents/get_or_create/').success(function(data){
          $scope.surveySessionId = data.session_id;
          $scope.respondentId = data.respondent_id;
          $scope.setCurrentNodeById(data.current_node_id);
        })

        $scope.currentDecisionDestination = null;
        $scope.currentAnswers = [];
      }

      $scope.setCurrentNodeBySession = function() {
        $scope.currentNode = $scope.fetchNodeById(sessionCurrentNodeId);
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

      var answersForParams = function(answersArray) {
        return _.map(answersArray, function(answerObject){
          return {
            id: answerObject.id
            // TODO: add rank
          }
        })
      }

      $scope.submit = function(decisionId){
        console.log($scope);
        var paramSafeAnswers = answersForParams($scope.currentAnswers);
        var params = {
          is_decision: $scope.currentNode.is_decision_point,
          respondent_id: $scope.respondentId,
          node_id: $scope.currentNode.node_id,
          decision_id: decisionId || null,
          answers: paramSafeAnswers || null,
          next_node_id: $scope.currentNode.next_node_id
        }
        $http.post('/api/response', { response: params }).success(function(data){
          // post to API and then on success:
          $scope.goToNextNode();

          // clear decision prepping for next question (can move to own method)
          $scope.currentDecisionDestination = null;
          // clear answers prepping for next question (can move into above-mentioned)
          $scope.currentAnswers = [];
        });
      };

      $scope.setup();
    }
  ])
