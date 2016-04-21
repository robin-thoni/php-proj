angular.module('app')
    .controller('SignUpController', ['$scope', '$state', '$mdDialog', 'luticateAuthUsers',
        function($scope, $state, $mdDialog, luticateAuthUsers) {
            $scope.user = {
                Username: "",
                Passwords: {
                    Password1: "",
                    Password2: ""
                },
                Firstname: "",
                Lastname: "",
                Email: ""
            };

            $scope.error = null;

            $scope.signUp = function () {
                $scope.error = null;
                if ($scope.user.Passwords.Password1 != $scope.user.Passwords.Password2) {
                    $scope.error = {
                        Data: "Passwords do not match"
                    };
                    return;
                }
                if ($scope.user.Username == "" || $scope.user.Firstname == ""
                    || $scope.user.Lastname == "" || $scope.user.Email == "") {
                    return;
                }
                luticateAuthUsers.add({
                    username: $scope.user.Username,
                    password: $scope.user.Passwords.Password1,
                    firstname: $scope.user.Firstname,
                    lastname: $scope.user.Lastname,
                    email: $scope.user.Email
                }).then(function(data)
                {
                    $state.go("login");
                }, function (error) {
                    $scope.error = error;
                })
            };
    }]);
