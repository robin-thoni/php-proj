/**
 * Created by robin on 4/22/16.
 */

(function()
{
    angular.module("appSdk").factory("ImagesDataAccess", ['luticateRequest', function (luticateRequest) {
        var DataAccess = {};

        var entry_point = "/api/images/";

        DataAccess.getAll = function(data, promise)
        {
            return luticateRequest.get(entry_point, data, promise);
        };

        return DataAccess;
    }])
})();