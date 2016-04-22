angular.module('app')
    .controller('UploadController', ['$scope', '$state', '$mdDialog',
        function($scope, $state, $mdDialog) {

            $scope.image = null;

            $scope.fileDropped = function(content, file)
            {
                $scope.image = {
                    content: content,
                    name: file.name
                };
            };
    }]);
