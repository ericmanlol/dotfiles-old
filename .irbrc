# Info/code for this file were borrowed from the following places:
#   http://bit.ly/174dkWL
#   https://gist.github.com/adamcrown/932231
#   https://gist.github.com/patmcnally/893833
 
begin
 
  # ansi colors
  ANSI = {}
  ANSI[:RESET]     = "\e[0m"
  ANSI[:BOLD]      = "\e[1m"
  ANSI[:UNDERLINE] = "\e[4m"
  ANSI[:LGRAY]     = "\e[0;37m"
  ANSI[:GRAY]      = "\e[1;30m"
  ANSI[:RED]       = "\e[31m"
  ANSI[:GREEN]     = "\e[32m"
  ANSI[:YELLOW]    = "\e[33m"
  ANSI[:BLUE]      = "\e[34m"
  ANSI[:MAGENTA]   = "\e[35m"
  ANSI[:CYAN]      = "\e[36m"
  ANSI[:WHITE]     = "\e[37m"
 
  # load a gem that may or may not be handled by bundler in your directory
  # see links above for details on this
  def unbundled_require gem
    if defined?(::Bundler)
      # Have to check for a version to avoid gems with dashes, e.g. pry-rails
      spec_path = Dir.glob("#{Gem.dir}/specifications/#{gem}-[0-9]*.gemspec").last
      if spec_path.nil?
        warn "#{ANSI[:BOLD]}Couldn't find #{gem}#{ANSI[:RESET]}"
        return
      end
 
      spec = Gem::Specification.load spec_path
      spec.runtime_dependencies.each do |dependency|
        puts "loading dependency #{dependency}"
        # TODO: handle versions
        unbundled_require dependency.name
      end
      spec.activate
    end
 
    begin
      require gem
      yield if block_given?
    rescue Exception => err
      warn "#{ANSI[:BOLD]}Couldn't load #{gem}: #{err}#{ANSI[:RESET]}"
    end
  end
 
  require 'irb/ext/save-history'
  require 'irb/completion'
 
  # Optional - blank?, present?, and time stuff can be handy
  require 'active_support'
  require 'active_support/core_ext'
 
  # general irb config
  IRB.conf[:AUTO_INDENT] = true
 
  # irb history
  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:EVAL_HISTORY] = 100
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irbhistory"
   
  # improved formatting for objects
  unbundled_require 'awesome_print' do
    AwesomePrint.irb!
  end
 
  # load interactive_editor
  unbundled_require 'interactive_editor'
 
  # Benchmarking helper (http://ozmm.org/posts/time_in_irb.html)
  if defined? Benchmark
    def benchmark(times = 1)
      ret = nil
      Benchmark.bm { |x| x.report { times.times { ret = yield } } }
      ret
    end
  end
 
  # Random time generator
  class Time
    def self.random(from=Time.at(0), to=Time.now)
      Time.at rand(to.to_f - from.to_f) + from.to_f
    end
  end
 
  # Return a list of methods defined locally for a particular object.  Useful
  # for seeing what it does whilst losing all the guff that's implemented
  # by its parents (eg Object).
  class Object
    def local_methods(obj = self)
      (obj.methods - obj.class.superclass.instance_methods).sort
    end
  end
 
  # pretty much the same as `local_methods` minus the constructors, etc 
  class Object
    def interesting_methods
      case self.class
      when Class
        self.public_methods.sort - Object.public_methods
      when Module
        self.public_methods.sort - Module.public_methods
      else
        self.public_methods.sort - Object.new.public_methods
      end
    end
  end
 
  ##########################
  ## Rails-specific stuff ##
  ##########################
  if defined? Rails
 
    # Show log in Rails console
    require 'logger'
 
    # Show active record logging in console
    def loud_logger
      enable_hirb
      set_logger_to Logger.new(STDOUT)
    end
 
    # disable active record logging
    def quiet_logger
      disable_hirb
      set_logger_to nil
    end
 
    # set active record logger to provided interface
    def set_logger_to(logger)
      if defined? ActiveRecord
        ActiveRecord::Base.logger = logger
        ActiveRecord::Base.clear_reloadable_connections!
      end
    end
 
    # load hirb for table formatting
    unbundled_require 'hirb' do
      HIRB_LOADED = true
    end
 
    # enable hirb
    def enable_hirb
      if HIRB_LOADED
        Hirb::Formatter.dynamic_config['ActiveRecord::Base']
        Hirb.enable
      else
        puts "hirb is not loaded"
      end
    end
 
    # disable hirb
    def disable_hirb
      if HIRB_LOADED
        Hirb.disable
      else
        puts "hirb is not loaded"
      end
    end
 
    # turn on the loud logging by default
    IRB.conf[:IRB_RC] = Proc.new { loud_logger }
 
    # Enable route helpers in Rails console
    include Rails.application.routes.url_helpers
 
    # Some rails defaults
    default_url_options[:host] = 'localhost'
    default_url_options[:port] = 3000
 
    # set a nice prompt
    rails_root = File.basename(Dir.pwd)
    IRB.conf[:PROMPT] ||= {}
    IRB.conf[:PROMPT][:RAILS] = {
      :PROMPT_I => "#{ANSI[:CYAN]}#{rails_root}>#{ANSI[:RESET]} ",
      :PROMPT_N => "#{ANSI[:CYAN]}#{rails_root}>#{ANSI[:RESET]} ",
      :PROMPT_S => "#{ANSI[:YELLOW]}#{rails_root}*#{ANSI[:RESET]} ",
      :PROMPT_C => "#{ANSI[:RED]}#{rails_root}?#{ANSI[:RESET]} ",
      :RETURN   => "#{ANSI[:GREEN]}=>#{ANSI[:RESET]} %s\n"
    }
    IRB.conf[:PROMPT_MODE] = :RAILS
 
    # find a user by email address
    def efind(email)
      User.find_by_email email
    end
 
    # run an ad-hoc sql query
    def sql(query)
      ActiveRecord::Base.connection.select_all(query)
    end
 
    # list column names of an active record model
    def show(obj)
      if obj.respond_to?('column_names')
        puts "#{ANSI[:BOLD]}#{ANSI[:UNDERLINE]}#{obj}#{ANSI[:RESET]}"
        ap(obj.send("column_names"))
      else
        puts "No #{ANSI[:BOLD]}column_names#{ANSI[:RESET]} method was found on this object"
      end
    end
 
  else # not running from `rails console`
    # setup default prompt with some colors
    IRB.conf[:PROMPT][:SIMPLE_COLOR] = {
    :PROMPT_I => "#{ANSI[:CYAN]}>>#{ANSI[:RESET]} ",
    :PROMPT_N => "#{ANSI[:CYAN]}>>#{ANSI[:RESET]} ",
    :PROMPT_C => "#{ANSI[:RED]}?>#{ANSI[:RESET]} ",
    :PROMPT_S => "#{ANSI[:YELLOW]}?>#{ANSI[:RESET]} ",
    :RETURN   => "#{ANSI[:GREEN]}=>#{ANSI[:RESET]} %s\n",
    :AUTO_INDENT => true }
    IRB.conf[:PROMPT_MODE] = :SIMPLE_COLOR
  end
 
rescue Exception => e
  warn "#{ANSI[:BOLD]}Error loading irbrc: #{e}#{ANSI[:RESET]}"
end


puts "custom config sucessfully loaded"
