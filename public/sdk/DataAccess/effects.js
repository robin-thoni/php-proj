/**
 * Created by robin on 4/22/16.
 */

(function()
{
    angular.module("appSdk").factory("EffectsDataAccess", ['luticateRequest', function (luticateRequest) {
        var DataAccess = {};

        var entry_point = "/api/effects/";

        DataAccess.apply = function(data, promise)
        {
            return luticateRequest.post(entry_point + data.effect + "/apply", {data: JSON.stringify(data)}, null, promise);
        };
        
        return DataAccess;
    }])
})();