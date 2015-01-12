describe('AppCtrl', function(){
  var scope, ctrl, $httpBackend;

  // load app module definition before each test
  beforeEach(module('lawaApp'));

  // inject services and attach to variable with same name (the ones _likeThis_)
  beforeEach(inject(function($controller, _$httpBackend_){
    $httpBackend = _$httpBackend_;
    var params = new RegExp('.');
    $httpBackend.expectGET('/api/respondents/get_or_create?' + params).
      respond(
        {
          respondent_id: 1,
          session_id: "abc123"
        }
      );
      scope = {}
      ctrl = $controller('AppCtrl', {$scope:scope});
    }));

    it('sets a currentSessionId from the browser data', function() {
      expect(scope.currentSessionId).toEqual('hello');
    });

    it('gets a respondent from the API', function() {
      expect(scope.respondent).toBeUndefined();
      $httpBackend.flush();

      expect(scope.respondent).toEqual(
        {
          respondent_id: 1,
          session_id: "abc123"
        }
      );
    });

  });
