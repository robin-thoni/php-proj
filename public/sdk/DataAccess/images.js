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

        DataAccess.delete = function(data, promise)
        {
            return luticateRequest.post(entry_point + data.image_id + "/del", null, null, promise);
        };

        DataAccess.upload = function(data, promise)
        {
            return luticateRequest.post(entry_point + "upload", {image: JSON.stringify(data)}, null, promise);
        };

        return DataAccess;
    }])
})();