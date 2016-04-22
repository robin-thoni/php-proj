angular.module('app')
    .controller('UploadController', ['$scope', '$state', '$mdDialog', 'EffectsBusiness', 'ImagesBusiness', 'luticateAuthCache',
        function($scope, $state, $mdDialog, EffectsBusiness, ImagesBusiness, luticateAuthCache) {

            $scope.image = null;
            
            var promiseImage = {
                id: "promiseImage",
                groups: ["imageView"]
            };

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
            
            $scope.applyEffect = function(effect, data)
            {
                EffectsBusiness.apply({
                    effect: effect,
                    image: $scope.image.content,
                    data: data
                }, promiseImage).then(function(data)
                {
                    $scope.image.content = data.image;
                }, function (error)
                {
                    console.log(error);
                });
            };

            $scope.isUploadVisible = function () {
                return luticateAuthCache.getUser() != null;
            };

            $scope.canUpload = function () {
                return $scope.image != null;
            };

            $scope.upload = function()
            {
                ImagesBusiness.upload({
                    image: $scope.image.content,
                    name: $scope.image.name
                }, promiseImage).then(function(data)
                {
                    console.log(data);
                }, function (error) {
                    console.log(error);
                });
            };

            $scope.test = function()
            {
                $scope.applyEffect("BlackAndWhite", null);
            };
    }]);
