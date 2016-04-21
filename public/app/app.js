'use strict';

/* App Module */

angular.module('app', [
    'ui.bootstrap',
    'ui.router',
    'LocalStorageModule',
    'ngMaterial',
    'dialogs.main',
    'luticateAuth',
    'luticateUtils',
    'appSdk'
])
    .config(['$stateProvider', '$urlRouterProvider',
        function($stateProvider, $urlRouterProvider) {

            $stateProvider.state('root', {
                abstract: true,
                template: '<div ui-view=""></div>',
                resolve: ['luticateAuthUsers', function(luticateAuthUsers)
                {
                    return luticateAuthUsers.loadUserData(null);
                }]
            });

            $stateProvider.state('home', {
                url:'/',
                parent: 'root',
                title: "Home",
                reloadOnSearch: false,
                templateUrl:'views/home.html',
                controller:'HomeController'
            });

            $urlRouterProvider.otherwise('/');
    }])
    .directive('dateNow', ['$filter', function($filter) {
        return {
            link: function( $scope, $element, $attrs) {
                $element.text($filter('date')(new Date(), $attrs.dateNow));
            }
        };
    }])
    .run(['$rootScope', '$state',
        function ($rootScope, $state) {
            $rootScope.$on('$stateChangeSuccess', function (event, current, previous) {
                $rootScope.title = current.title + " - App";
            });
    }]);