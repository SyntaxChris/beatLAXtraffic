describe('NodeCtrl', function(){
  beforeEach(module('lawaApp'));

  it('something should be something', inject(function($controller) {
    var scope = {},
        ctrl = $controller('NodeCtrl', {$scope:scope});

    expect(scope.someVar).toBe('var value');
  }));
});
