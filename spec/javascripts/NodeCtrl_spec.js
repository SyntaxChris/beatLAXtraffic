describe('NodeCtrl', function(){
  beforeEach(module('lawaApp'));

  it('should have a variable that works', inject(function($controller) {
    var scope = {},
        ctrl = $controller('NodeCtrl', {$scope:scope});

    expect(scope.catName).toBe('Mooskers');
  }));
});
