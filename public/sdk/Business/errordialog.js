/**
 * Created by robin on 4/24/16.
 */

(function () {
    angular.module("appSdk").factory("errorDialogMd", ['luticateDialogErrorHelper', '$mdDialog', function (luticateDialogErrorHelper, $mdDialog) {
        var Factory = {};

        Factory.errorMessage = function(data)
        {
            return luticateDialogErrorHelper.errorMessage(data);
        };

        Factory.errorDialog = function(data)
        {
            $mdDialog.show(
                $mdDialog.alert()
                    // .parent(angular.element(document.querySelector('#popupContainer')))
                    .clickOutsideToClose(true)
                    .title('Error')
                    .textContent(Factory.errorMessage(data))
                    .ok('OK')
            );
        };

        return Factory;
    }]);
})();