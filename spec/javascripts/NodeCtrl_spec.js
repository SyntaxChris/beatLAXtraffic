describe('NodeCtrl', function(){
  beforeEach(module('lawaApp'));

  it('currentNode is an integer', inject(function($controller) {
    var scope = {},
        ctrl = $controller('NodeCtrl', {$scope:scope});

    expect(scope.currentNode).toEqual(jasmine.any(Number));
  }));
});
