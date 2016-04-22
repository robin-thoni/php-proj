/**
 * Created by robin on 4/22/16.
 */

(function()
{
    angular.module("appSdk").factory("ImagesBusiness", ['ImagesDataAccess', '$q', function (ImagesDataAccess, $q) {
        var Business = {};

        Business.getAll = ImagesDataAccess.getAll;

        Business.upload = function(data, promise)
        {
            data.image = btoa(data.image);

            return ImagesDataAccess.upload(data, promise);
        };

        return Business;
    }])
})();