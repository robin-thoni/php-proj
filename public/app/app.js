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

            $stateProvider.state('login', {
                url:'/login',
                parent: 'root',
                title: "Login",
                reloadOnSearch: false,
                templateUrl:'views/login.html',
                controller:'LoginController'
            });

            $stateProvider.state('signUp', {
                url:'/signUp',
                parent: 'root',
                title: "Sign Up",
                reloadOnSearch: false,
                templateUrl:'views/signup.html',
                controller:'SignUpController'
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
                $rootScope.title = current.title + " - 420px";
            });
    }]);