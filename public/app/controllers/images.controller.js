angular.module('app')
    .controller('ImagesController', ['$scope', '$state', '$mdDialog', 'ImagesBusiness', 'luticateAuthCache', 'errorDialogMd',
        function($scope, $state, $mdDialog, ImagesBusiness, luticateAuthCache, errorDialogMd) {

            $scope.luticateAuthCache = luticateAuthCache;

            var promiseLoad = {
                id: "promiseLoad",
                loaderGroups: ["images"]
            };
            
            $scope.options = {
                page: 0,
                perPage: 30,
                only_mine: luticateAuthCache.getUser() != null
            };

            $scope.images = [];

            $scope.reload = function()
            {
                ImagesBusiness.getAll($scope.options, promiseLoad).then(function(data)
                {
                    $scope.images = data;
                }, errorDialogMd.errorDialog);
            };

            $scope.delete = function(image_id)
            {
                ImagesBusiness.delete({image_id: image_id}, promiseLoad).then(function (data) {
                    $scope.reload();
                }, errorDialogMd.errorDialog);
            };

            $scope.reload();
    }]);
