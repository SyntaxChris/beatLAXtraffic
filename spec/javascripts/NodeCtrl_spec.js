describe('NodeCtrl', function(){
  var scope, ctrl, $httpBackend;

  // load app module definition before each test
  beforeEach(module('lawaApp'));

  // inject services and attach to variable with same name (the ones _likeThis_)
  beforeEach(inject(function($controller, _$httpBackend_){
    $httpBackend = _$httpBackend_;
    $httpBackend.expectGET('/api/nodes').
      respond(
        [
          {
            "node_id":1,
            "is_decision_point":false,
            "question":{
              "id":1,
              "question":"About how far away from LAX do you live?",
            },
            "answers":[
              {
                "id":1,
                "answer":"Less than 30 minute drive away"
              }
            ]
          }
        ]
      );
          scope = {}
          ctrl = $controller('NodeCtrl', {$scope:scope});
      }));

    it('gets a collection of all nodes', function() {
      expect(scope.nodes).toBeUndefined();
      $httpBackend.flush();

      expect(scope.nodes).toEqual(
        [
          {
            "node_id":1,
            "is_decision_point":false,
            "question":{
              "id":1,
              "question":"About how far away from LAX do you live?",
            },
            "answers":[
              {
                "id":1,
                "answer":"Less than 30 minute drive away"
              }
            ]
          }
        ]
      );
    });

  });
