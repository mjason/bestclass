source 'http://ruby.taobao.org'

gem 'rails', '3.2.12'

# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'bootstrap-sass', '~> 2.2.2.0'
  gem 'bootswatch-rails'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# client mvc
gem 'batman-rails'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# 存储
gem "mongoid", "~> 3.0.0"

# user
gem "devise"
gem "cancan"

group :test, :development do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
  # 测试套件
  gem "guard"
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false

  gem "thin"
end