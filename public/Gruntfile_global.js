/**
 * Created by robin on 11/10/15.
 */

module.exports = function(grunt) {

    grunt.loadNpmTasks('grunt-contrib-copy');

    var path = require('path');

    grunt.initConfig({
        globals: {
            releasePath: 'build/release',
            appFolder: '.',
            staticFiles: [
                'favicon.ico',
                'index.html'
            ]
        },
        copy: {
            release: {
                files: [
                    {
                        expand: true,
                        cwd:'<%= globals.appFolder %>/',
                        src: ['<%= globals.staticFiles %>'],
                        dest: '<%= globals.releasePath %>'
                    }
                ]
            }
        }
    });
    grunt.registerTask('default', [
        'copy:release'
    ]);


};