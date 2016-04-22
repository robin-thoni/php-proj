/**
 * Created by robin on 4/22/16.
 */

(function()
{
    angular.module("appSdk").factory("EffectsBusiness", ['EffectsDataAccess', '$q', function (EffectsDataAccess, $q) {
        var Business = {};

        Business.apply = function(data, promise)
        {
            var defer = $q.defer();

            data.image = btoa(data.image);

            EffectsDataAccess.apply(data, promise).then(function(data)
            {
                data.image = atob(data.image);
                defer.resolve(data);
            }, defer.reject);

            return defer.promise;
        };
        
        return Business;
    }])
})();