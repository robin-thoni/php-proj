/**
 * Created by robin on 11/10/15.
 */

module.exports = function(grunt) {

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-usemin');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-less');

    var path = require('path');

    grunt.initConfig({
        globals: {
            releasePath: 'build/release/app',
            appFolder: 'app',
            staticFiles: [
                'views/**/*.html',
                'index.html',
                'img/**',
                'fonts/**'
            ]
        },
        useminPrepare: {
            release: '<%= globals.appFolder %>/index.html',
            options: {
                flow: {
                    release: {
                        steps: {
                            'js': [
                                'concat',
                                {
                                    name: 'uglify',
                                    createConfig: function (context, block) {
                                        var cfg = {files: []},
                                            filesDef = {};


                                        filesDef.dest = path.join('<%= globals.releasePath %>', block.dest);
                                        filesDef.src = [];
                                        context.inFiles.forEach(function (inFile) {
                                            filesDef.src.push(path.join(context.inDir, inFile));
                                        });

                                        cfg.files.push(filesDef);
                                        return cfg;
                                    }
                                }
                            ],
                            'css': ['concat',
                                {
                                    name: 'cssmin',
                                    createConfig: function (context, block) {
                                        var cfg = {files: []},
                                            filesDef = {};


                                        filesDef.dest = path.join('<%= globals.releasePath %>', block.dest);
                                        filesDef.src = [];
                                        context.inFiles.forEach(function (inFile) {
                                            filesDef.src.push(path.join(context.inDir, inFile));
                                        });

                                        cfg.files.push(filesDef);
                                        return cfg;
                                    }
                                }],
                            'less': [
                                {
                                    name: 'less',
                                    createConfig: function (context, block) {
                                        var cfg = {files: []},
                                            filesDef = {};

                                        context.options.generated.options = {
                                            cleancss: true
                                        };

                                        filesDef.dest = path.join('<%= globals.releasePath %>', block.dest);
                                        filesDef.src = [];
                                        context.inFiles.forEach(function (inFile) {
                                            filesDef.src.push(path.join(context.inDir, inFile));
                                        });

                                        cfg.files.push(filesDef);
                                        return cfg;
                                    }
                                }
                            ]
                        },
                        post: {

                        }
                    }
                }
            }
        },
        usemin: {
            html: '<%= globals.releasePath %>/index.html',
            options: {
                blockReplacements: {
                    less: function (block) {
                        return '<link rel=\"stylesheet\" href=\"' + block.dest + '\"/>';
                    }
                }
            }
        },
        copy: {
            release: {
                files: [
                    {
                        expand: true,
                        cwd:'<%= globals.appFolder %>/',
                        src: ['<%= globals.staticFiles %>'],
                        dest: '<%= globals.releasePath %>'
                    },
                    {
                        expand: true,
                        cwd:'<%= globals.appFolder %>/../bower_components/flat-ui/dist/fonts/',
                        src: ['**'],
                        dest: '<%= globals.releasePath %>/fonts/'
                    }
                ]
            }
        },
        clean: {
            release: ['<%= globals.releasePath %>/*']
        }
    });
    grunt.registerTask('default', [
        'clean:release',
        'useminPrepare:release',
        'concat:generated',
        'uglify:generated',
        'copy:release',
        'cssmin:generated',
        'less:generated',
        'usemin'
    ]);


};