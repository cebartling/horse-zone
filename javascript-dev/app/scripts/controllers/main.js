'use strict';

/**
 * @ngdoc function
 * @name javascriptDevApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the javascriptDevApp
 */
angular.module('javascriptDevApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
