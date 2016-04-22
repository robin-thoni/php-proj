/**
 * Created by robin on 4/22/16.
 */

(function () {
    angular.module('app').directive("imageDropzone", function() {
        return {
            restrict : "A",
            scope: {
                'imageDropzone': '&'
            },
            link: function (scope, elem) {
                function processEvent(evt)
                {
                    if (evt != null) {
                        evt.stopPropagation();
                        evt.preventDefault();
                        if (evt.dataTransfer) {
                            evt.dataTransfer.effectAllowed = 'copy';
                            evt.dataTransfer.dropEffect = 'copy';
                        }
                        else {
                            evt.originalEvent.dataTransfer.effectAllowed = 'copy';
                            evt.originalEvent.dataTransfer.dropEffect = 'copy';
                        }
                    }
                    return false;
                }
                elem.bind('dragover', processEvent);
                elem.bind('dragenter', processEvent);
                elem.bind('dragstart', processEvent);
                elem.bind('drop', function(evt) {
                    evt.stopPropagation();
                    evt.preventDefault();

                    var files = null;
                    if (evt.dataTransfer) {
                        files = evt.dataTransfer.files;
                    }
                    else {
                        files = evt.originalEvent.dataTransfer.files;
                    }

                    for (var i = 0, f; f = files[i]; i++) {
                        var reader = new FileReader();
                        reader.readAsBinaryString(f);

                        reader.onload = (function(file) {
                            return function(e) {
                                scope.$apply(function() {
                                    scope.imageDropzone({
                                        content: e.target.result,
                                        file: file
                                    });
                                });
                            };
                        })(f);
                    }
                    return false;
                });
            }
        }
    })
})();