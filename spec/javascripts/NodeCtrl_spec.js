describe('NodeCtrl', function(){
  beforeEach(module('lawaApp'));

  it('', inject(function($controller) {
    var scope = {},
        ctrl = $controller('NodeCtrl', {$scope:scope});

    expect(scope.someVar).toBe('var value');
  }));
});
