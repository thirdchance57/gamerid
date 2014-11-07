var app = angular.module('gameridApp', ['ui.router']);

app.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise('/');

  // $stateProvider

  //   .state('home', {
  //     url: '/home',
  //     template: '<h1>HOME VIEW {{tag}}</h1>',
  //     controller: function($scope){$scope.tag='WEEEEE'}
  //   });
  //   .state('about', {
  //     url: '/about',
  //     template: '<h1>ABOUT VIEW</h1><a ui-sref=".portfolio">PORTFOLIO LINK</a><div ui-view></div>'
  //   })
  //   .state('about.portfolio', {
  //     url: '/portfolio',
  //     template: '<h1>PORTFOLIO VIEW {{tag}}</h1>',
  //     controller: function($scope){$scope.tag = '...we made it!'}
  //   });

});