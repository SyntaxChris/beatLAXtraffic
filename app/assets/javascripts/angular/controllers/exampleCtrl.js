angular.module('app.exampleApp').controller("ExampleCtrl", [
  '$scope', function($scope) {

    $scope.quizRunning = true;
    $scope.currentQuestion = 1;

    $scope.advanceQuestion = function(clickedQId){
      $scope.currentQuestion = clickedQId + 1;
      if($scope.currentQuestion > 5) {
        $scope.quizRunning = false;
      };
    };

    $scope.restartQuiz = function(){
      $scope.currentQuestion = 1;
      $scope.quizRunning = true;
    };

    $scope.surveyQuestions = [
      {
        id: 1,
        question: "What choice will you pick?",
        answer_1: "This choice",
        answer_2: "That choice"
      },
      {
        id: 2,
        question: "What will they think of next?",
        answer_1: "Diced bread",
        answer_2: "Re-lectricity"
      },
      {
        id: 3,
        question: "How many questions will there be?",
        answer_1: "5",
        answer_2: "Pickle"
      },
      {
        id: 4,
        question: "I'm hungry",
        answer_1: "Me too!",
        answer_2: "Deal with it."
      },
      {
        id: 5,
        question: "DOGS",
        answer_1: "CATS",
        answer_2: "DOGS"
      }
    ]

  }
]);
