/**
 * Created by robin on 11/1/15.
 */

angular.module('app')
    .controller('ToolBarController', ['$scope', '$state', '$mdSidenav',
        function($scope, $state, $mdSidenav) {

                $scope.toggleSideBar = function()
                {
                    $mdSidenav('left').toggle();
                };
        }]);
