;;; Compiled snippets and support files for `js-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("la" "(function(obj){var m=''; for (var k in obj) {if (obj.hasOwnProperty(k)) { m += k+ ':'+obj[k]+'\\n';} } ${1:alert}(m);})(${2:obj});\n" "console.log/alert object properties" nil nil nil nil nil nil)
                       ("fn" "${1:attribute}: function (${2:args}) {\n    $0\n},\n" "attr: function() { ... }" nil nil nil nil nil nil)
                       ("case.yasnippet" "case $1:\n	$0\n	break;\n\n" "case" nil nil nil nil nil nil)
                       ("fn" "function ${1:name} (${2:args}) {\n  console.log('${1:$(yas/substr yas-text \"[^ ]*\")} called');\n  $0\n}\n" "function fn(...) { console.log('fn called'); }" nil nil nil nil nil nil)
                       ("fn" "var ${1:name} = function (${2:args}) {\n  console.log('${1:$(yas/substr yas-text \"[^ ]*\")} called');\n  $0\n};\n" "var name = function (...) { console.log('fn called'); }" nil nil nil nil nil nil)
                       ("fn" "that.${1:name} = function (${2:args}) {\n  console.log('that.${1:$(yas/substr yas-text \"[^ ]*\")} called');\n  $0\n};\n" "that.name = function (...) { console.log('fn called'); };" nil nil nil nil nil nil)
                       ("for" "for (${1:i} = ${2:0}; $1 < $3.length; $1++) {\n  $0\n}\n" "for" nil nil nil nil nil nil)
                       ("forin.yasnippet" "for( ${1:var} in ${2:obj} )\n{\n    $0\n}" "forin" nil nil nil nil nil nil)
                       ("main" "module.exports = function(grunt) {\n\n  // Project configuration.\n  grunt.initConfig({\n    pkg: grunt.file.readJSON('package.json'),\n    uglify: {\n      build: {\n        src: '<%= pkg.name %>.js',\n        dest: '<%= pkg.name %>.min.js'\n      }\n    }\n    $0\n  });\n\n  // Load the plugin that provides the \"uglify\" task.\n  grunt.loadNpmTasks('grunt-contrib-uglify');\n\n  // Default task(s).\n  grunt.registerTask('default', ['uglify']);\n\n};\n" "gruntfile.js main" nil nil nil nil nil nil)
                       ("if.yasnippet" "if (${1:element} === ${2:true}) {\n  $0\n}\n" "if" nil nil nil nil nil nil)
                       ("ife" "if (${1:condition}) {\n    $2\n} else {\n    $0\n}\n" "if...else" nil nil nil nil nil nil)
                       ("indent" "// Local Variables:\n// coding: utf-8\n// tab-width: ${1:2}\n// js-indent-level: ${1:$(yas/substr yas-text \"[0-9]*\")}\n// js2-basic-offset: ${1:$(yas/substr yas-text \"[0-9]*\")}\n// End:\n// vim: set fs=javascript fenc=utf-8 et ts=${1:$(yas/substr yas-text \"[0-9]*\")} sts=${1:$(yas/substr yas-text \"[0-9]*\")} sw=${1:$(yas/substr yas-text \"[0-9]*\")}\n" "indent" nil nil nil nil nil nil)
                       ("jslint" "/*global $, utag, describe, beforeEach, module, inject, it, expect, app, ko, Raphael, require, angular, setInterval, clearInterval, jQuery, define, KeyEvent, setTimeout, clearTimeout, AccessifyHTML5, log */\n" "jslint header" nil nil nil nil nil nil)
                       ("lambda" "(function() {\n  // set up css style\n  (function() {\n    var style=''\n      + '${1:div {display:block; }}\\n'\n      ;\n    var styleElement = document.createElement('style');\n    styleElement.type = 'text/css';\n    if (styleElement.styleSheet) {\n      styleElement.styleSheet.cssText = style;\n    } else {\n      styleElement.appendChild(document.createTextNode(style));\n    }\n    document.getElementsByTagName('head')[0].appendChild(styleElement);\n  })();\n\n  //jquery plugin code placed here\n  (function($) {\n    $0\n  })(jQuery);\n\n  //place your code below this line\n  console.log('hello world');\n})();\n" "(function(){ css+js+gif })();" nil nil nil nil nil nil)
                       ("lambda" "(function(${1:v}) {\n  $0;\n})(${2:externalVar});\n" "(function(...){...})(...);" nil nil nil nil nil nil)
                       ("lambda" "(function(${1:v}) {\n  $0;\n}).call(this, ${2:externalVar});\n" "(function(){...}).call(this, ...);" nil nil nil nil nil nil)
                       ("lwf" "console.log('${1:`(which-function)`} called');" "console.log which function called" nil nil nil nil nil nil)
                       ("l" "console.log('${1:hello world}');" "console.log" nil nil nil nil nil nil)
                       ("lo" "console.log('${1:object}=', ${1:$(yas/substr yas-text \"[^ ]*\")});" "console.log(description,object)" nil nil nil nil nil nil)
                       ("foreach" "for (var k in ${1:obj}) {\n  if ($1.hasOwnProperty(k)) {\n    var ${2:val} = $1[k];\n    $0 \n  }\n}\n" "loop key/value object" nil nil nil nil nil nil)
                       ("mod" "(function(exports){\n  $0\n})(window.$1 = {});" "mod" nil nil nil nil nil nil)
                       ("main" "#!/usr/bin/env node\n// @see http://shapeshed.com/command-line-utilities-with-nodejs/\nvar args=process.argv.slice(2);\nconsole.log(args);\nconsole.log('hello world');\nprocess.exit(0);\n" "main program for nodejs" nil nil nil nil nil nil)
                       ("proto.yasnippet" "${1:className}.prototype.${2:methodName} = function(${3:args}) {\n  $0\n}\n" "proto" nil nil nil nil nil nil)
                       ("?" "? ${1:true} : ${2:false}\n" "? ... : ..." nil nil nil nil nil nil)
                       ("switch" "switch ($1) {\ncase $2:\n  $0\n  break;\ndefault:\n  break;\n}\n" "switch" nil nil nil nil nil nil)
                       ("timeout" "setTimeout( function(){ ${1:alert('hello world')}; }, ${2:2000} );\n" "setTimeout( ... )" nil nil nil nil nil nil)
                       ("try.yasnippet" "try {\n  $1\n} catch (e) {\n  $0\n}\n" "try" nil nil nil nil nil nil)
                       ("v.yasnippet" "var ${1:element} = ${2:value}\n" "v" nil nil nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("abroadcast" "$scope.$broadcast('${1:eventHello}', data);\n" "$scope.$broadcast (fire event down $scope)" nil
                        ("angular")
                        nil nil nil nil)
                       ("aemit" "$scope.$emit('${1:eventHello}', data);\n" "$scope.$emit (fire event up $scope)" nil
                        ("angular")
                        nil nil nil nil)
                       ("ahttp" "$http.${1:post}(${2:url})\n  .success(function(resp) {\n    console.log('resp=', resp);\n    $0\n  })\n  .error(function(reason) {\n    console.log('reason=', reason);\n  });\n" "$http.post().success(function() {...}); (angular)" nil
                        ("angular")
                        nil nil nil nil)
                       ("amain" "// insert <html ng-app=\"myApp\"> or <body ng-app=\"myApp\"> into html\nangular.module('myApp', ['ui.bootstrap']);\nvar app = angular.module('myApp');\napp.controller('MainCtrl', function ($scope) {\n  $scope.max = 100;\n  $scope.dynamic = 50;\n});\n" "agnular.main" nil
                        ("angular")
                        nil nil nil nil)
                       ("acontroller" "app.controller('${1:MyController}', function ($scope, ${2:$http}) {\n  console.log('${1:$(yas/substr yas-text \"[^ ]*\")} registered');\n  var that = this;\n  $scope.fn1 = function () {\n    $0\n  };\n});\n" "angular.controller" nil nil nil nil nil nil)
                       ("adirective" "directive('$1', function ($2) {\n  return function (scope, element, attrs$4) {\n    $3\n  };\n});\n" "angular.directive" nil nil nil nil nil nil)
                       ("afilter" "filter('$1', function ($2) {\n  return function (input, $3) {\n    $3\n  };\n});\n" "angular.filter" nil
                        ("angular")
                        nil nil nil nil)
                       ("amodule" "angular.module('$1', [$2]);\n" "angular.module" nil
                        ("angular")
                        nil nil nil nil)
                       ("aon" "$scope.$on('$1', function (event, data) {\n  $0\n});\n" "$scope.$on" nil
                        ("angular")
                        nil nil nil nil)
                       ("aon" "$scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {\n  $0\n});\n" "$scope.$on('$stateChangeSuccess'), ...);" nil
                        ("angular")
                        nil nil nil nil)
                       ("aq" "var a = [1, 40, 50, 100, 1000];\nvar promises = [];\n\nangular.forEach(a, function(addr) {\n  // make sure deferred refer to different object\n  var deferred = $q.defer();\n  if(a > 50) {\n    deferred.reject();\n  } else {\n    deferred.resolve(a);\n  }\n  promises.push(deferred.promise);\n});\n\n$q.all(promises).then(function(results) {\n  console.log('results=', results);\n});\n" "$q.all([...]).then(...)" nil
                        ("angular")
                        nil nil nil nil)
                       ("af" "$scope.${1:init} = function() {\n  $0\n  console.log('$scope.${1:$(yas/substr yas-text \"[^ ]*\")} called');\n};\n" "$scope.fname= function() { ... } (angular)" nil
                        ("angular")
                        nil nil nil nil)
                       ("atimeout" "$timeout(function() {\n  $0\n}, ${1:500});\n" "$timout(function() {...});" nil
                        ("angular")
                        nil nil nil nil)
                       ("av" "$scope.$1 = $2;\n$0\n" "$scope.name = value;" nil
                        ("angular")
                        nil nil nil nil)
                       ("awatch" "$scope.$watch('$1', function (newValue, oldValue) {\n  $0\n});\n" "$scope.watch" nil
                        ("angular")
                        nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("jasmine-describe" "# -*- mode: snippet -*-\n# group: jasmine\n# name: jasmine describe\n# key: jdescribe\ndescribe('$1', function(){\n  beforeEach(function(){\n    $2\n  });\n\n  afterEach(function(){\n    $3\n  });\n\n  it('$4', function(){\n    $5\n  });\n\n  $0\n});\n" "jasmine-describe" nil nil nil nil nil nil)
                       ("jexpect" "expect($1).toBe(${2:true});\n" "jasmine expect" nil
                        ("jasmine")
                        nil nil nil nil)
                       ("jit" "it('$1', function(){\n  expect($2).toBe(${3:true});\n});\n$0\n" "jasmine it" nil
                        ("jasmine")
                        nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("ajax" "$.ajax({\n  type:'${1:POST}',\n  url:${2:url},\n  data:${3:data},\n  dataType:'${4:json}',\n  success: function(resp){\n    $0\n  }\n});\n" "$.ajax({options})" nil
                        ("jquery")
                        nil nil nil nil)
                       ("ajaxqueue" "// @see https://gist.github.com/guybedford/2470554\n$.AjaxQueue = function() {\n  this.reqs = [];\n  this.requesting = false;\n};\n$.AjaxQueue.prototype = {\n  add: function(req) {\n    this.reqs.push(req);\n    this.next();\n  },\n  next: function() {\n    if (this.reqs.length == 0){\n      if(this.allDone){\n        this.allDone.apply(this);\n      }\n      return;\n    }\n    if (this.requesting == true){\n      return;\n    }\n    var req = this.reqs.splice(0, 1)[0];\n    var complete = req.complete;\n    var self = this;\n    req.complete = function() {\n      if (complete) {\n        complete.apply(this, arguments);\n      }\n      self.requesting = false;\n      self.next();\n    };\n    this.requesting = true;\n    $.ajax(req);\n  }\n};\n" "var q=new $.AjaxQueue();q.add(req);" nil
                        ("jquery")
                        nil nil nil nil)
                       ("att" "attr(${1:item})$0" "jQuery Attr()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("cha" "change(function(){\n  $0\n});" "jQuery change()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("chi" "children( ${1:item} )$0" "Children" nil
                        ("jquery")
                        nil nil nil nil)
                       ("click" "$('${1:#myid}').click( function() {\n    $0\n});\n" "jQuery Click" nil
                        ("jquery")
                        nil nil nil nil)
                       ("eac" "$.each(${1:an-array}, function(i){\n    $0\n});" "jQuery each()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("get" "$.get(${1:url}, ${2:values}, function(data){\n    $0\n},'json');\n" "$.get(url, values, ...)" nil
                        ("jquery")
                        nil nil nil nil)
                       ("has" "hasClass( \"${1:class}\" )$0" "jQuery hasClass()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("hook" "(function ($) {\n  var originalFn = this.originalFn = $.fn.${1:val};\n  $.fn.${1:$(yas/substr yas-text \"[^ ]*\")} = function(${2:value}) {\n    if (typeof ${2:$(yas/substr yas-text \"[^ ]*\")} == 'undefined') {\n      //set\n      if ($(this).hasClass('${3:jsStripSpace}')) {\n        var v=originalFn.call(this);\n        v = v.replace(/\\s/g, '');\n        return v;\n      }\n      return originalFn.call(this);\n    } else {\n      //get\n      return originalFn.call(this, ${1:$(yas/substr yas-text \"[^ ]*\")});\n    }\n  };\n})(jQuery);\n" "hook $.fn.some-function" nil
                        ("jquery")
                        nil nil nil nil)
                       ("hov" "hover( \n    function(){\n    $0\n    },\n    function(){\n\n    }\n);" "jQuery selector" nil
                        ("jquery")
                        nil nil nil nil)
                       ("is" "is(\"${1:condition}\")$0\n" "jQuery Is" nil
                        ("jquery")
                        nil nil nil nil)
                       ("$" "\\$(${1:\"#selector\"}).$0" "jQuery selector" nil
                        ("jquery")
                        nil nil nil nil)
                       ("validate" "// @see http://jqueryvalidation.org/validate/\n$('${1:#myform}').validate({\n  rules: {\n    ${2:itemName}: {\n      required: true\n    }\n  },\n  messages: {\n    ${2:$(yas/substr yas-text \"[^ ]*\")}: \"${3:itemMessage}\"\n  },\n  // OPTIONAL\n  errorPlacement: function(label, element) {\n    // special control\n    if(element[0].id==='${4:item1}' ){\n      label.insertAfter(element.parent()[0]);\n    } else {\n      // default behaviour\n      label.insertAfter(element[0]);\n    }\n  },\n  // OPTIONAL\n  submitHandler: function(form) {\n    // $(form).ajaxSubmit();\n    form.submit();\n  },\n  // OPTIONAL\n  invalidHandler: function(event, validator) {\n    // 'this' refers to the form\n    var errors = validator.numberOfInvalids();\n    if (errors) {\n      $0\n    } else {\n    }\n  }\n});\n" "$('#myform).validate({rules:...})" nil
                        ("jquery")
                        nil nil nil nil)
                       ("json" "\\$.getJSON( \"${1:url/to/hit}\", function( data ){\n  $0\n});\n" "jQuery getJSON()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("ne" "next(${1:'#selector'}).$0" "jQuery next()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("post" "$.post(${1:url}, ${2:values}, function(data){\n    $0\n},\"json\");\n" "$.post(url, vaules, ...)" nil
                        ("jquery")
                        nil nil nil nil)
                       ("rea" "$(document).ready( function(){\n    $0\n});" "jQuery Ready" nil
                        ("jquery")
                        nil nil nil nil)
                       ("sib" "siblings(${1:\"#selector\"}).$0" "jQuery siblings()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("sli" "slideDown(${1:'slow'}).$0" "jQuery slideDown()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("sli" "slideUp(${1:'slow'}).$0" "jQuery slideUp()" nil
                        ("jquery")
                        nil nil nil nil)
                       ("tog" "toggleClass('${1:class}')$0\n" "jQuery toggleClass()" nil
                        ("jquery")
                        nil nil nil nil)))


;;; Snippet definitions:
;;;
(yas-define-snippets 'js-mode
                     '(("bind" "_.bind(${1:function}, ${2:object}, ${3:parameters});$0\n" "bind" nil nil nil nil nil nil)
                       ("forEach" "_.forEach(${1:arr}, function(e) {\n  $0;\n});\n" "_.forEach" nil nil nil nil nil nil)
                       ("filter" "_.filter(${1:arr}, function(e) {\n  $0;\n});\n" "_.filter" nil nil nil nil nil nil)
                       ("ufd" "_.find(${1:arr}, function(e){\n  $0;\n});\n" "underscore find" nil nil nil nil nil nil)
                       ("map" "_.map(${1:arr}, function(e) {\n  $0;\n});\n" "_.map" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
