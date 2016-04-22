angular.module('app')
    .controller('UploadController', ['$scope', '$state', '$mdDialog',
        function($scope, $state, $mdDialog) {

            $scope.image = null;

            $scope.input = angular.element(angular.element("#filePicker")[0]);
            $scope.input.on("change", function (e) {
                var reader = new FileReader();
                var f = e.target.files[0];
                reader.readAsBinaryString(f);
                reader.onload = (function(file) {
                    return function(e) {
                        $scope.$apply(function() {
                            $scope.fileLoaded(e.target.result, file);
                        });
                    };
                })(f);
            });

            $scope.fileLoaded = function(content, file)
            {
                $scope.image = {
                    content: content,
                    name: file.name
                };
            };

            $scope.pickFile = function()
            {
                $scope.input.click();
            };
    }]);
