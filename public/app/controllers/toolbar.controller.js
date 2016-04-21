/**
 * Created by robin on 11/1/15.
 */

angular.module('app')
    .controller('ToolBarController', ['$scope', '$state', '$mdSidenav', 'luticateAuthCache',
        function($scope, $state, $mdSidenav, luticateAuthCache) {

                $scope.toggleSideBar = function()
                {
                    $mdSidenav('left').toggle();
                };
                
                $scope.getCurrentUser = function () {
                        return luticateAuthCache.getUser();
                };

                $scope.isLogged = function () {
                        return $scope.getCurrentUser() != null;
                };
        }]);
