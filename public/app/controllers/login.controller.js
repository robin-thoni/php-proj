angular.module('app')
    .controller('LoginController', ['$scope', '$state', '$mdDialog', 'luticateAuthUsers',
        function($scope, $state, $mdDialog, luticateAuthUsers) {
            
            $scope.user = {
                Username: "",
                Password: ""
            };

            $scope.error = null;
            
            $scope.login = function()
            {
                $scope.error = null;
                if ($scope.user.Username == "" || $scope.user.Password == "") {
                    return;
                }
                luticateAuthUsers.login({
                    username: $scope.user.Username,
                    password: $scope.user.Password
                }).then(function(data)
                {
                    $state.go("images");
                }, function (error) {
                    $scope.error = error;
                });
            };
    }]);
