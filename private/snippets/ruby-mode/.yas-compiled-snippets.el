;;; Compiled snippets and support files for `ruby-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'ruby-mode
                     '(("Array" "Array.new(${10}) { |${i}| $0 }" "Array.new(10) { |i| ... }" nil
                        ("Arrays")
                        nil nil nil nil)
                       ("Dir" "Dir.glob(${1:\"dir/glob/*}\") { |${2:file}| $0 }" "Dir.glob(\"..\") do |file| .. end" nil
                        ("Files")
                        nil nil nil nil)
                       ("Enum" "include Enumerable\n\ndef each(&block)\n  $0\nend" "Enum" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("File" "File.foreach(${1:\"${2:path/to/file}\"}) { |${3:line}| $0 }" "File" nil
                        ("Files")
                        nil nil nil nil)
                       ("File.1" "File.open(${1:\"${2:path/to/file}\"}${3/(^[rwab+]+$)|.*/(?1:, \")/}${3:w}${3/(^[rwab+]+$)|.*/(?1:\")/}) { |${4:file}| $0 }" "File.1" nil
                        ("Files")
                        nil nil nil nil)
                       ("File.2" "File.read(${1:\"${2:path/to/file}\"})" "File.2" nil
                        ("Files")
                        nil nil nil nil)
                       ("Forw-" "extend Forwardable" "Forw-" nil nil nil nil nil nil)
                       ("Hash" "Hash.new { |${1:hash}, ${2:key}| ${1:hash}[${2:key}] = $0 }" "Hash" nil
                        ("Hashes")
                        nil nil nil nil)
                       ("Md" "File.open(${1:\"${2:path/to/file}.dump\"}, \"w\") { |${3:file}| Marshal.dump(${4:obj}, ${3:file}) }" "Md" nil nil nil nil nil nil)
                       ("Ml" "File.open(${1:\"${2:path/to/file}.dump\"}) { |${3:file}| Marshal.load(${3:file}) }" "Ml" nil nil nil nil nil nil)
                       ("Pn-" "PStore.new(${1:\"${2:file_name.pstore}\"})" "Pn-" nil nil nil nil nil nil)
                       ("README.markdown" "# Snippets for Ruby Mode\n\n## About\n\nComprehensive collection of Ruby snippets for\n[yasnippet](http://code.google.com/p/yasnippet/ \"yasnippet - Google Code\").\nThe collection also contains snippets for major Ruby frameworks like Rails\nand RSpec.\n\nThe Rails snippets were originally borrowed from\n[mknittig/yasnippet-rails](http://github.com/eschulte/yasnippets-rails/tree).\n\nThe RSpec snippets require that RSpec files are edited in a separate\nEmacs mode. I recommend using\n[rspec-mode.el](http://github.com/Chrononaut/rspec-mode.el/tree/master).\nThe RSpec snippets were originally borrowed from\n[gary/yasnippets-rspec](http://github.com/gary/yasnippets-rspec/tree/master).\n\n## Contributors\n\n* [Bjørn Arild Mæland](http://github.com/Chrononaut)\n* [Jean-Sébastien Ney](http://github.com/jney)\n* [John Andrews](http://github.com/jxa)\n\nAnd much of the credits should naturally go to the yasnippet-rails and\nyasnippet-rspec authors.\n\nThanks to Jeff Wheeler for his work on the snippet_copier.py script!\n" "README.markdown" nil nil nil nil nil nil)
                       ("Yd-" "File.open(${1:\"${2:path/to/file}.yaml\"}, \"w\") { |${3:file}| YAML.dump(${4:obj}, ${3:file}) }" "Yd-" nil nil nil nil nil nil)
                       ("Yl-" "File.open(\"${1:path/to/file.yaml}\") { |${2:file}| YAML.load(${2:file}) }" "YAML.load(file)" nil nil nil nil nil nil)
                       ("aa" "attr_accessor :$0" "attr_accesor :..." nil nil nil nil nil nil)
                       ("ae" "assert_equal ${expected}, ${actual}\n" "assert_equal  ... ,  ... " nil
                        ("assert")
                        nil nil nil nil)
                       ("aft" "after(${1::each}) do\n  $0\nend" "after" nil nil nil nil nil nil)
                       ("ako" "assert_kind_of ${class}, ${object}\n" "assert_kind_of  ... ,  ... " nil
                        ("assert")
                        nil nil nil nil)
                       ("ann" "assert_not_nil ${object}\n" "assert_not_nil  ... " nil
                        ("assert")
                        nil nil nil nil)
                       ("annot" "any_number_of_times" "any_number_of_times" nil nil nil nil nil nil)
                       ("anr" "and_return(${1:value})$0" "and_return($value)" nil nil nil nil nil nil)
                       ("anra" "and_raise(${1:RuntimeError})$0" "and_raise($error)" nil nil nil nil nil nil)
                       ("anrb" "and_return { $1 }" "and_return with block" nil nil nil nil nil nil)
                       ("ant" "and_throw(${1:sym})" "and_throw" nil nil nil nil nil nil)
                       ("ar" "attr_reader :$0" "attr_reader :..." nil nil nil nil nil nil)
                       ("ars" "assert_response :${success}\n" "assert_response : ... " nil
                        ("assert")
                        nil nil nil nil)
                       ("art" "assert_redirected_to :controller => \"${controller}\"\n" "assert_redirected_to :controller => \" ... \"" nil
                        ("assert")
                        nil nil nil nil)
                       ("asnr" "assert_nothing_raised(${1:Exception}) { $0 }" "asnr" nil
                        ("Tests")
                        nil nil nil nil)
                       ("asnt" "assert_nothing_thrown { $0 }" "asnt" nil
                        ("Tests")
                        nil nil nil nil)
                       ("asr" "assert_raise(${1:Exception}) { $0 }" "asr" nil
                        ("Tests")
                        nil nil nil nil)
                       ("ast" "assert_throws(:${1:expected}) { $0 }" "ast" nil
                        ("Tests")
                        nil nil nil nil)
                       ("atl" "at_least(${1:n}).times" "at_least" nil nil nil nil nil nil)
                       ("atm" "at_most(${1:n}).times" "at_most" nil nil nil nil nil nil)
                       ("bef" "before(${1::each}) do\n  $0\nend" "before" nil nil nil nil nil nil)
                       ("befm" "before(:each) do\n  @${1:model} = ${1:$(replace-regexp-in-string \"_\" \"\" (upcase-initials text))}.new$0\nend\n" "before (rspec)" nil nil nil nil nil nil)
                       ("begin" "begin\n  $3\nrescue ${1:Exception} => ${2:e}\n  $0\nend" "begin ... rescue ... end" nil
                        ("Blocks")
                        nil nil nil nil)
                       ("bfe" "before(:each) do\n  $0\nend" "before(:each) do ... end" nil nil nil nil nil nil)
                       ("bm-" "TESTS = ${1:10_000}\nBenchmark.bmbm do |results|\n  $0\nend" "bm-" nil nil nil nil nil nil)
                       ("bt" "belongs_to :${class}\n" "belongs_to : ... " nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("cl" "classify { |${e}| $0 }" "classify { |...| ... }" nil nil nil nil nil nil)
                       ("cla-" "class ${1:ClassName} < DelegateClass(${2:ParentClass})\n  def initialize(${3:args})\n    super(${4:del_obj})\n    \n    $0\n  end\n  \n  \nend" "class .. < DelegateClass .. initialize .. end  (class)" nil
                        ("definitions")
                        nil nil nil nil)
                       ("cla.1" "${1:${TM_FILENAME/(?:\\A|_)([A-Za-z0-9]+)(?:\\.rb)?/(?2::\\u$1)/g}} = Struct.new(:${2:attr_names}) do\n  def ${3:method_name}\n    $0\n  end\n  \n  \nend" "cla.1" nil
                        ("definitions")
                        nil nil nil nil)
                       ("cla.2" "class ${1:${TM_FILENAME/(?:\\A|_)([A-Za-z0-9]+)(?:\\.rb)?/(?2::\\u$1)/g}}\n  $0\nend" "cla.2" nil
                        ("definitions")
                        nil nil nil nil)
                       ("cla.3" "class ${1:${TM_FILENAME/(?:\\A|_)([A-Za-z0-9]+)(?:\\.rb)?/(?2::\\u$1)/g}}\n  def initialize${2/(^.*?\\S.*)|.*/(?1:\\()/}${2:args}${2/(^.*?\\S.*)|.*/(?1:\\))/}\n    $0\n  end\n  \n  \nend" "cla.3" nil
                        ("definitions")
                        nil nil nil nil)
                       ("cla.4" "class ${1:BlankSlate}\n  instance_methods.each { |meth| undef_method(meth) unless meth =~ /\\A__/ }\n  \n  def initialize${2/(^.*?\\S.*)|.*/(?1:\\()/}${2:args}${2/(^.*?\\S.*)|.*/(?1:\\))/}\n    @${3:delegate} = ${4:delegate_object}\n    \n    $0\n  end\n  \n  def method_missing(meth, *args, &block)\n    @${3:delegate}.send(meth, *args, &block)\n  end\n  \n  \nend" "cla.4" nil
                        ("definitions")
                        nil nil nil nil)
                       ("clafn" "split(\"::\").inject(Object) { |par, const| par.const_get(const) }" "class_from_name()" nil nil nil nil nil nil)
                       ("col" "collect { |${e}| $0 }\n" "collect { |e| ... }" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("conn" "controller_name :${1:controller}" "controller_name" nil nil nil nil nil nil)
                       ("def" "def ${1:method_name}\n  $0\nend\n" "def ... end" nil
                        ("definitions")
                        nil nil nil nil)
                       ("defd" "def_delegator :${1:@del_obj}, :${2:del_meth}, :${3:new_name}\n" "defd" nil nil nil nil nil nil)
                       ("defmm" "def method_missing(meth, *args, &blk)\n  $0\nend" "defmm" nil nil nil nil nil nil)
                       ("defs" "def self.${1:class_method_name}\n  $0\nend" "def.self ... end" nil nil nil nil nil nil)
                       ("deft" "def test_${1:case_name}\n  $0\nend" "deft" nil nil nil nil nil nil)
                       ("des" "describe '${1:description}' do\n\n  it 'should ${2:description}' do\n    $0\n  end\n\nend" "describe (String)" nil nil nil nil nil nil)
                       ("desc" "describe \"${1:method}\" do\n  it$0\nend" "describe (rspec)" nil nil nil nil nil nil)
                       ("desrc.delete" "require File.direname(__FILE__) + '/.../spec_helper'\n\ndescribe ${1:controller}, 'DELETE ${3:/some/path}${4: with some parameters}' do\n\n  $0\n\nend" "describe (RESTful Controller): DELETE" nil nil nil nil nil nil)
                       ("desrc.get" "require File.direname(__FILE__) + '/.../spec_helper'\n\ndescribe ${1:controller}, 'GET ${3:/some/path}${4: with some parameters}' do\n\n  $0\n\nend" "describe (RESTful Controller): GET" nil nil nil nil nil nil)
                       ("desrc.post" "require File.direname(__FILE__) + '/.../spec_helper'\n\ndescribe ${1:controller}, 'POST ${3:/some/path}${4: with some parameters}' do\n\n  $0\n\nend" "describe (RESTful Controller): POST" nil nil nil nil nil nil)
                       ("desrc.put" "require File.direname(__FILE__) + '/.../spec_helper'\n\ndescribe ${1:controller}, 'PUT ${3:/some/path}${4: with some parameters}' do\n\n  $0\n\nend" "describe (RESTful Controller): PUT" nil nil nil nil nil nil)
                       ("dest" "describe ${1:Type} do\n\n  it 'should ${2:description}' do\n    $0\n  end\n\nend" "describe (type)" nil nil nil nil nil nil)
                       ("dests" "describe ${1:Type}, '${2:description}' do\n\n  it 'should ${3:description}' do\n    $0\n  end\n\nend" "describe (type, string)" nil nil nil nil nil nil)
                       ("do" "do |${1:variable}|\n  $0\nend" "do |variable| ... end" nil
                        ("Blocks")
                        nil nil nil nil)
                       ("dow" "downto(${1:0}) { ${2/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:|)/}${2:n}${2/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:| )/}$0 }" "dow" nil
                        ("Loops")
                        nil nil nil nil)
                       ("eab" "each_byte { |${1:byte}| $0 }" "eab" nil nil nil nil nil nil)
                       ("eac-" "each_char { |${1:chr}| $0 }" "eac-" nil nil nil nil nil nil)
                       ("eak" "each_key { |${1:key}| $0 }" "eak" nil nil nil nil nil nil)
                       ("eal" "each_line$1 { |${2:line}| $0 }" "eal" nil nil nil nil nil nil)
                       ("eap" "each_pair { |${1:name}, ${2:val}| $0 }" "eap" nil nil nil nil nil nil)
                       ("eas-" "each_slice(${1:2}) { |${2:group}| $0 }" "eas-" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("env" "#!/usr/bin/env ruby\n" "/usr/bin/env ruby" nil nil nil nil nil nil)
                       ("ex" "exactly(${1:n}).times" "exactly" nil nil nil nil nil nil)
                       ("fet" "fetch(${1:name}) { ${2/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:|)/}${2:key}${2/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:| )/}$0 }" "fet" nil nil nil nil nil nil)
                       ("fil" "fill(${1:range}) { ${2/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:|)/}${2:i}${2/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:| )/}$0 }" "fil" nil nil nil nil nil nil)
                       ("filedn" "File.dirname(${1:__FILE__}) + \"/$0\"" "File.dirname(__FILE__)" nil
                        ("Files")
                        nil nil nil nil)
                       ("fread" "File.open(${1:\"/my/file/path\"}, \"r\").each_line do |${2:l}|\n  ${3:puts l}\n  $0\nend\n" "File.open(\"...\",\"r\")" nil nil nil nil nil nil)
                       ("fin" "find { |${1:e}| $0 }" "find { |e| .. }" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("fina" "find_all { |${1:e}| $0 }" "fina" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("flao" "inject(Array.new) { |${1:arr}, ${2:a}| ${1:arr}.push(*${2:a}) }" "flao" nil
                        ("Arrays")
                        nil nil nil nil)
                       ("flsh" "flash[:${notice}] = \"${Text here...}\"\n" "flash[: ... ] = \" ... \"" nil
                        ("Rails")
                        nil nil nil nil)
                       ("fm" "${1:var} = flexmock('${2:mock_name}')\n$0" "flexmock mock object w/name" nil nil nil nil nil nil)
                       ("fmar" "${1:var} = flexmock(:model, ${2:YourModel})\n$0" "flexmock mock object, ActiveRecord" nil nil nil nil nil nil)
                       ("gre" "grep(${1:/${2:pattern}/}) { |${3:match}| $0 }" "gre" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("gsu" "gsub(/${1:pattern}/) { ${2/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:|)/}${2:match}${2/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:| )/}$0 }" "gsu" nil nil nil nil nil nil)
                       ("hm" "has_many :${class}\n" "has_many : ... " nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("ho" "has_one :${class}\n" "has_one : ... " nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("i" "def initialize(${1:params})\n  ${2:body}\nend\n$0" "def initialize(...) ... end" nil nil nil nil nil nil)
                       ("indent" "# Local Variables:\n# ruby-indent-level: $1\n# tab-width: ${1:$(yas/substr yas-text \"[0-9]*\")}\n# indent-tabs-mode: nil\n# End:\n# vim: set fs=javascript fenc=utf-8 et ts=${1:$(yas/substr yas-text \"[0-9]*\")} sts=${1:$(yas/substr yas-text \"[0-9]*\")} sw=${1:$(yas/substr yas-text \"[0-9]*\")}\n" "indent" nil nil nil nil nil nil)
                       ("inj" "inject${1/.+/(/}${1:init}${1/.+/)/} { |${2:mem}, ${3:var}| $0 }" "inj" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("it" "it \"should ${1:do something}\" do\n  $0\nend" "it \"should do something\" do ... end" nil nil nil nil nil nil)
                       ("lam" "lambda { ${1/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:|)/}${1:args}${1/(^(?<var>\\s*(?:\\*|\\*?[a-z_])[a-zA-Z0-9_]*\\s*)(,\\g<var>)*,?\\s*$)|.*/(?1:| )/}$0 }" "lam" nil nil nil nil nil nil)
                       ("l" "logger.warn \"${1:hello}\"\n" "log.warn \"hello\"" nil nil nil nil nil nil)
                       ("lo" "logger.warn \"${1:object}=#{${1:$(yas/substr yas-text \"[^ ]*\")}.inspect}\"\n" "logger.warn object.inspect" nil nil nil nil nil nil)
                       ("lo" "puts \"${1:object}=\",${1:$(yas/substr yas-text \"[^ ]*\")}.inspect\n" "puts object.inspect" nil nil nil nil nil nil)
                       ("loo" "loop { $0 }" "loop { .. }" nil
                        ("Loops")
                        nil nil nil nil)
                       ("map" "map { |${1:e}| $0 }" "map" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("mapwi-" "enum_with_index.map { |${1:e}, ${2:i}| $0 }" "mapwi-" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("mat" "class ${1:ReverseTo}\n  def initialize($3)\n    @$3 = $3\n  end\n\n  def matches?(actual)\n    @actual = actual\n    # Satisfy expectation here. Return false or raise an error if it's not met.\n    $0@actual.reverse.should == @$3\n    true\n  end\n\n  def failure_message\n    \"expected #{@actual.inspect} to $2 #{@$3.inspect}, but it didn't\"\n  end\n\n  def negative_failure_message\n    \"expected #{@actual.inspect} not to $2 #{@$3.inspect}, but it did\"\n  end\nend\n\ndef ${2:reverse_to}(${3:expected})\n  $1.new($3)\nend" "custom matcher" nil nil nil nil nil nil)
                       ("max" "max { |a, b| $0 }" "max" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("min" "min { |a, b| $0 }" "min" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("mocw.flexmock" "Spec::Runner.configure do |config|\n  config.mock_with :flexmock\nend" "mock_with flexmock" nil nil nil nil nil nil)
                       ("mocw.mocha" "Spec::Runner.configure do |config|\n  config.mock_with :mocha\nend" "mock_with mocha" nil nil nil nil nil nil)
                       ("mocw.rr" "Spec::Runner.configure do |config|\n  config.mock_with :rr\nend" "mock_with rr" nil nil nil nil nil nil)
                       ("mod" "module ${ModuleName}\n  $0\nend\n" "module ModuleName ... end" nil nil nil nil nil nil)
                       ("mod.1" "module ${1:ModuleName}\n  module ClassMethods\n    $0\n  end\n  \n  module InstanceMethods\n    \n  end\n  \n  def self.included(receiver)\n    receiver.extend         ClassMethods\n    receiver.send :include, InstanceMethods\n  end\nend\n" "mod.1" nil nil nil nil nil nil)
                       ("module" "module ${ModuleName}\n  $0\nend\n" "module ModuleName ... end" nil nil nil nil nil nil)
                       ("nam" "namespace :${1:${TM_FILENAME/\\.\\w+//}} do\n  $0\nend" "nam" nil nil nil nil nil nil)
                       ("on" "once" "once" nil nil nil nil nil nil)
                       ("ope" "open(${1:\"${2:path/or/url/or/pipe}\"}${3/(^[rwab+]+$)|.*/(?1:, \")/}${3:w}${3/(^[rwab+]+$)|.*/(?1:\")/}) { |${4:io}| $0 }" "ope" nil nil nil nil nil nil)
                       ("opt" "opts.on( \"-${1:o}\", \"--${2:long-option-name}\"${3/^\\s*$|(.*\\S.*)/(?1:, )/}${3:String},\n         \"${4:Option description.}\" ) do |${6:opt}|\n  $0\nend" "opt" nil nil nil nil nil nil)
                       ("optp" "require \"optparse\"\n\noptions = {${1::default => \"args\"}}\n\nARGV.options do |opts|\n  opts.banner = \"Usage:  #{File.basename(\\$PROGRAM_NAME)} [OPTIONS]${2/^\\s*$|(.*\\S.*)/(?1: )/}${2:OTHER_ARGS}\"\n  \n  opts.separator \"\"\n  opts.separator \"Specific Options:\"\n  \n  $0\n  \n  opts.separator \"Common Options:\"\n  \n  opts.on( \"-h\", \"--help\",\n           \"Show this message.\" ) do\n    puts opts\n    exit\n  end\n  \n  begin\n    opts.parse!\n  rescue\n    puts opts\n    exit\n  end\nend\n" "optp" nil nil nil nil nil nil)
                       ("par" "params[:${id}]\n" "params[: ... ]" nil
                        ("Rails")
                        nil nil nil nil)
                       ("patfh" "File.join(File.dirname(__FILE__), *%w[${1:rel path here}])" "patfh" nil nil nil nil nil nil)
                       ("pend" "__END__\n" "program end" nil nil nil nil nil nil)
                       ("ra" "render :action => \"${action}\"\n" "render :action => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("ral" "render :action => \"${action}\", :layout => \"${layoutname}\"\n" "render :action => \" ... \", :layout => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("ran" "sort_by { rand }" "ran" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("rcea" "render_component :action => \"${index}\"\n" "render_component :action => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rcec" "render_component :controller => \"${items}\"\n" "render_component :controller => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rceca" "render_component :controller => \"${items}\", :action => \"${index}\"\n" "render_component :controller => \" ... \", :action => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rea" "redirect_to :action => \"${index}\"\n" "redirect_to :action => \" ... \"" nil
                        ("Rails redirect")
                        nil nil nil nil)
                       ("reai" "redirect_to :action => \"${show}\", :id => ${@item}\n" "redirect_to :action => \" ... \", :id =>  ... " nil
                        ("Rails redirect")
                        nil nil nil nil)
                       ("rec" "redirect_to :controller => \"${items}\"\n" "redirect_to :controller => \" ... \"" nil
                        ("Rails redirect")
                        nil nil nil nil)
                       ("reca" "redirect_to :controller => \"${items}\", :action => \"${list}\"\n" "redirect_to :controller => \" ... \", :action => \" ... \"" nil
                        ("Rails redirect")
                        nil nil nil nil)
                       ("recai" "redirect_to :controller => \"${items}\", :action => \"${show}\", :id => ${@item}\n" "redirect_to :controller => \" ... \", :action => \" ... \", :id =>  ... " nil
                        ("Rails redirect")
                        nil nil nil nil)
                       ("rej" "reject { |${1:e}| $0 }" "reject { |e| .. }" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("rep" "results.report(\"${1:name}:\") { TESTS.times { $0 } }" "results_report(..) { .. }" nil nil nil nil nil nil)
                       ("res" "respond_to do |format|\n  format.${1:html} $0\nend" "respond_to do |format| .." nil
                        ("ActionController")
                        nil nil nil nil)
                       ("resh" "require File.dirname(__FILE__) + '/../spec_helper'" "Require spec_helper" nil nil nil nil nil nil)
                       ("reve" "reverse_each { |${1:e}| $0 }" "reve" nil nil nil nil nil nil)
                       ("rf" "render :file => \"${filepath}\"\n" "render :file => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rfu" "render :file => \"${filepath}\", :use_full_path => ${false}\n" "render :file => \" ... \", :use_full_path =>  ... " nil
                        ("Rails render")
                        nil nil nil nil)
                       ("ri" "render :inline => \"${<%= 'hello' %>}\"\n" "render :inline => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("ril" "render :inline => \"${<%= 'hello' %>}\", :locals => { ${name} => \"${value}\" }\n" "render :inline => \" ... \", :locals => {  ...  => \" ... \" }" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rit" "render :inline => \"${<%= 'hello' %>}\", :type => :${rxml})\n" "render :inline => \" ... \", :type => : ... )" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rl" "render :layout => \"${layoutname}\"\n" "render :layout => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rn" "render :nothing => ${true}\n" "render :nothing =>  ... " nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rns" "render :nothing => ${true}, :status => ${401}\n" "render :nothing =>  ... , :status =>  ... " nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rp" "render :partial => \"${item}\"\n" "render :partial => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rpc" "render :partial => \"${item}\", :collection => ${items}\n" "render :partial => \" ... \", :collection =>  ... " nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rpl" "render :partial => \"${item}\", :locals => { :${name} => \"${value}\"}\n" "render :partial => \" ... \", :locals => { : ...  => \" ... \"}" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rpo" "render :partial => \"${item}\", :object => ${object}\n" "render :partial => \" ... \", :object =>  ... " nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rps" "render :partial => \"${item}\", :status => ${500}\n" "render :partial => \" ... \", :status =>  ... " nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rreq" "require File.join(File.dirname(__FILE__), $0)" "require File.join(File.dirname(__FILE__), ...)" nil nil nil nil nil nil)
                       ("rt" "render :text => \"${Text here...}\"\n" "render :text => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rtl" "render :text => \"${Text here...}\", :layout => \"${layoutname}\"\n" "render :text => \" ... \", :layout => \" ... \"" nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rtlt" "render :text => \"${Text here...}\", :layout => ${true}\n" "render :text => \" ... \", :layout =>  ... " nil
                        ("Rails render")
                        nil nil nil nil)
                       ("rts" "render :text => \"${Text here...}\", :status => ${401}\n" "render :text => \" ... \", :status =>  ... " nil
                        ("Rails render")
                        nil nil nil nil)
                       ("sca" "scan(/${1:pattern}/) { |${2:match}| $0 }" "scan(/../) { |match| .. }" nil nil nil nil nil nil)
                       ("sce" "Scenario '${1:title}' do\n  Given '${2:given}'\n  When '${3:when}'\n  Then '${4:then}'\nend\n$0" "Scenario" nil nil nil nil nil nil)
                       ("sel" "select { |${e}| $0 }" "select { |e| .. }" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("ses" "session[:${user}]$0\n" "session[: ... ]" nil
                        ("Rails")
                        nil nil nil nil)
                       ("set" "setup do\n  $1\nend" "setup do ... end" nil nil nil nil nil nil)
                       ("sh=" "${1:target}.should == ${2:value}\n$0" "should ==" nil nil nil nil nil nil)
                       ("shb" "${1:target}.should be(${2:result})\n$0" "should be" nil nil nil nil nil nil)
                       ("shbc" "${1:target}.should be_close(${2:result}, ${3:tolerance})\n$0" "should be_close" nil nil nil nil nil nil)
                       ("shbio" "${1:target}.should be_instance_of(${2:klass})\n$0" "should be_instance_of" nil nil nil nil nil nil)
                       ("shbko" "${1:target}.should be_a_kind_of(${2:klass})\n$0" "should be_kind_of" nil nil nil nil nil nil)
                       ("shbr" "response.should be_redirect\n$0" "should be_redirect" nil nil nil nil nil nil)
                       ("shbs" "response.should be_success\n$0" "should be_success" nil nil nil nil nil nil)
                       ("she.eql" "${1:target}.should eql(${2:value})\n$0" "should eql" nil nil nil nil nil nil)
                       ("she.equal" "${1:target}.should equal(${2:value})\n$0" "should equal" nil nil nil nil nil nil)
                       ("shh" "${1:target}.should have(${2:num}).${3:things}\n$0" "should have" nil nil nil nil nil nil)
                       ("shhal" "${1:target}.should have_at_least(${2:num}).${3:things}\n$0" "should have_at_least" nil nil nil nil nil nil)
                       ("shham" "${1:target}.should have_at_most(${2:num}).${3:things}\n$0" "should have_at_most" nil nil nil nil nil nil)
                       ("shhr" "${1:target}.should have(${2:x}).records\n$0" "should have_records" nil nil nil nil nil nil)
                       ("shm.match" "${1:target}.should match(/${2:regex}/)\n$0" "should match" nil nil nil nil nil nil)
                       ("shn=" "${1:target}.should_not == ${2:value}\n$0" "should_not ==" nil nil nil nil nil nil)
                       ("shnb" "${1:target}.should_not be(${2:result})\n$0" "should_not be" nil nil nil nil nil nil)
                       ("shnbc" "${1:target}.should_not be_close(${2:result}, ${3:tolerance})\n$0" "should_not be_close" nil nil nil nil nil nil)
                       ("shnbio" "${1:target}.should_not be_instance_of(${2:klass})\n$0" "should_not be_instance_of" nil nil nil nil nil nil)
                       ("shnbko" "${1:target}.should_not be_a_kind_of(${2:klass})\n$0" "should_not be_kind_of" nil nil nil nil nil nil)
                       ("shnbr" "response.should_not be_redirect\n$0" "should_not be_redirect" nil nil nil nil nil nil)
                       ("shnbs" "response.should_not be_success\n$0" "should_not be_success" nil nil nil nil nil nil)
                       ("shne.eql" "${1:target}.should_not eql(${2:value})\n$0" "should_not eql" nil nil nil nil nil nil)
                       ("shne.equal" "${1:target}.should_not equal(${2:value})\n$0" "should_not equal" nil nil nil nil nil nil)
                       ("shnm.match" "${1:target}.should_not match(/${2:regex}/)\n$0" "should_not match" nil nil nil nil nil nil)
                       ("shnp" "${1:target}.should_not ${2:be_}${3:predicate} $0" "should_not predicate" nil nil nil nil nil nil)
                       ("shnr" "${1:mock}.should_not_receive(:${2:message})$0" "should_not_receive" nil nil nil nil nil nil)
                       ("shnre" "lambda { ${1: } }.should_not raise_error(${2:error})\n$0" "should_not raise_error" nil nil nil nil nil nil)
                       ("shnrt" "${1:target}.should_not respond_to(:${2:sym})\n$0" "should_not respond_to" nil nil nil nil nil nil)
                       ("shns" "${1:target}.should_not satisfy { |obj| ${2: } }\n$0" "should_not satisfy" nil nil nil nil nil nil)
                       ("shnt" "lambda { ${1: } }.should_not throw_symbol(:${2:symbol})\n$0" "should_not throw" nil nil nil nil nil nil)
                       ("shp" "${1:target}.should ${2:be_}${3:predicate} $0" "should predicate" nil nil nil nil nil nil)
                       ("shr" "${1:mock}.should_receive(:${2:message})$0" "should_receive" nil nil nil nil nil nil)
                       ("shre" "lambda { ${1: } }.should raise_error(${2:error})\n$0" "should raise_error" nil nil nil nil nil nil)
                       ("shrt.redirect" "response.should redirect_to(${1:url})\n$0" "should redirect_to" nil nil nil nil nil nil)
                       ("shrt.render" "response.should render_template(:${1:template})\n$0" "should render_template" nil nil nil nil nil nil)
                       ("shrt.respond" "${1:target}.should respond_to(:${2:sym})\n$0" "should respond_to" nil nil nil nil nil nil)
                       ("shs" "${1:target}.should satisfy { |obj| ${2: } }\n$0" "should satisfy" nil nil nil nil nil nil)
                       ("sht" "lambda { ${1: } }.should throw_symbol(:${2:symbol})\n$0" "should throw" nil nil nil nil nil nil)
                       ("sinc" "class << self; self end" "singleton_class()" nil nil nil nil nil nil)
                       ("sor" "sort { |a, b| $0 }" "sort { |a, b| .. }" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("sorb" "sort_by { |${e}| $0 }" "sort_by { |e| .. }" nil
                        ("Enumerables")
                        nil nil nil nil)
                       ("sr" "should_receive(:${1:method}).and_return(${2:return_val})" "should_receive(:).and_return()" nil nil nil nil nil nil)
                       ("ste" "step(${1:2}) { |${2:n}| $0 }" "step(2) { |e| .. }" nil nil nil nil nil nil)
                       ("sto" "Story '${1:title}', %{\n  As a ${2:role}\n  I want ${3:feature}\n  So that ${4:value}\n} do\nend" "Story" nil nil nil nil nil nil)
                       ("stub" "${1:target}.stub!(:${2:message})$0" "$target.stub!(:$message)" nil nil nil nil nil nil)
                       ("sub" "sub(/${pattern}/) { |${match}| $0 }" "sub(/../) { |match| .. }" nil nil nil nil nil nil)
                       ("task" "task :${2:name} do\n  $0\nend" "task :name ... end" nil nil nil nil nil nil)
                       ("task.1" "desc \"${1:Task description}\"\ntask :${2:name} do\n  $0\nend" "desc ... task :name ... end" nil nil nil nil nil nil)
                       ("tc" "require \"test/unit\"\n\nrequire \"${1:library_file_name}\"\n\nclass Test${2:${1/([\\w&&[^_]]+)|./\\u$1/g}} < Test::Unit::TestCase\n  def test_${3:case_name}\n    $0\n  end\nend" "tc" nil nil nil nil nil nil)
                       ("tra" "transaction${1/(^.*?\\S.*)|.*/(?1:\\()/}${1:true}${1/(^.*?\\S.*)|.*/(?1:\\))/} { $0 }" "tra" nil nil nil nil nil nil)
                       ("ts" "require \"test/unit\"\n\nrequire \"tc_${1:test_case_file}\"\nrequire \"tc_${2:test_case_file}\"\n" "ts" nil nil nil nil nil nil)
                       ("tw" "twice" "twice" nil nil nil nil nil nil)
                       ("unif" "ARGF.each_line$1 do |${2:line}|\n  $0\nend" "unix_filter { .. }" nil nil nil nil nil nil)
                       ("unless" "unless ${1:condition}\n  $0\nend" "unless ... end" nil
                        ("Conditions")
                        nil nil nil nil)
                       ("usai" "if ARGV.$1\n  abort \"Usage:  #{\\$PROGRAM_NAME} ${2:ARGS_GO_HERE}\"\nend" "usai" nil nil nil nil nil nil)
                       ("usau" "unless ARGV.$1\n  abort \"Usage:  #{\\$PROGRAM_NAME} ${2:ARGS_GO_HERE}\"\nend" "usau" nil nil nil nil nil nil)
                       ("va" "validates_associated :${attr}\n" "validates_associated : ... " nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("vc" "validates_confirmation_of :${attr}\n" "validates_confirmation_of : ... " nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("ve" "validates_exclusion_of :${attr}\n" "validates_exclusion_of : ... " nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("vf" "validates_format_of :${attr}, :with => /${regex}/\n" "validates_format_of : ... , :with => / ... /" nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("vi" "validates_inclusion_of :${attr}" "validates_inclusion_of : ..." nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("vn" "validates_numericality_of :${attr}\n" "validates_numericality_of : ... " nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("vp" "validates_presence_of :${attr}" "validates_presence_of : ..." nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("vu" "validates_uniqueness_of :${attr}\n" "validates_uniqueness_of : ... " nil
                        ("ActiveRecord")
                        nil nil nil nil)
                       ("wia" "with(${1:args})\n$0" "with args" nil nil nil nil nil nil)
                       ("xml-" "REXML::Document.new(File.read(${1:\"${2:path/to/file}\"}))" "xml-" nil nil nil nil nil nil)
                       ("xpa" "elements.each(\"${1://XPath}\") do |${2:node}|\n  $0\nend" "xpath(..) { .. }" nil nil nil nil nil nil)
                       ("{" "{ |${1:variable}| $0 }" "{ |variable| ... }" nil
                        ("Blocks")
                        nil nil nil nil)))


;;; Do not edit! File generated at Thu May 28 14:17:45 2015
