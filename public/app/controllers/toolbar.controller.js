/**
 * Created by robin on 11/1/15.
 */

angular.module('app')
    .controller('ToolBarController', ['$scope', '$state', '$mdSidenav', 'luticateAuthCache', 'luticateAuthUsers',
        function($scope, $state, $mdSidenav, luticateAuthCache, luticateAuthUsers) {

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

                $scope.logout = function () {
                        luticateAuthUsers.logout().then(function(data)
                        {
                                $state.go("home");
                        });
                }
        }]);
