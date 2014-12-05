'use strict';

/**
 * @ngdoc function
 * @name javascriptDevApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the javascriptDevApp
 */
angular.module('javascriptDevApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
