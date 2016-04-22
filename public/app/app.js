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
    .config(['$stateProvider', '$urlRouterProvider', '$compileProvider', '$httpProvider',
        function($stateProvider, $urlRouterProvider, $compileProvider, $httpProvider) {

            $compileProvider.imgSrcSanitizationWhitelist(/^\s*(https?|ftp|mailto|data):/);

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

            $stateProvider.state('upload', {
                url:'/upload',
                parent: 'root',
                title: "Upload",
                reloadOnSearch: false,
                templateUrl:'views/upload.html',
                controller:'UploadController'
            });

            $urlRouterProvider.otherwise('/');

            $httpProvider.interceptors.push(['luticateAuthCache', '$injector', '$q',
                function (luticateAuthCache, $injector, $q) {
                    return {
                        'request': function (config) {
                            var token = luticateAuthCache.getToken();

                            if (token != null)
                                config.headers['X-Authorization'] = token;

                            return config;
                        },
                        'responseError': function(rejection) {
                            return $q.reject(rejection);
                        }
                    };
                }]);
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
    }]).filter("toDataUrl", function() {
    return function (data) {
        return "data:image/*;base64," + btoa(data);
    }
});