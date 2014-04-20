source 'http://ruby.taobao.org/'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem 'mysql2'

# 用户系统
gem 'devise'
gem 'devise-encryptable'

# 上传组件
gem 'carrierwave'
gem 'mini_magick'
gem 'carrierwave-upyun'
gem 'rest-client'

# 模板语言
gem 'liquid', '~> 2.6.1'

# 关联form
gem "nested_form"

# 分页
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap'

# 枚举
gem 'enumerize'

gem 'chinese_pinyin'

# pdf
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'

# 七牛
gem 'carrierwave-qiniu'

# 短信
gem 'china_sms'

# alipay
gem 'alipay', :github => 'chloerei/alipay'

# @
gem 'jquery-atwho-rails'
gem 'essage-rails'

# 权限
gem 'cancan'

# getvideo is parse video information on Ruby, you can get video media download url, cover, flash url and title.
gem 'getvideo', :git => 'git@github.com:yeeli/getvideo.git'

# 微信
gem 'weixin_rails_middleware', "~> 1.2.3"
gem 'weixin_authorize', '~> 1.5.7'
gem 'twitter_ratchet_rails'

# redis
gem "redis-namespace", "~> 1.4.1"

# 所见所得编辑器
gem 'simditor-rails'
gem "select2-rails"

# YAML 配置信息
gem "settingslogic"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Bootstrap
gem 'bootstrap-sass', '~> 3.1.0'

# Font Awesome
gem 'font-awesome-sass', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# slim
gem 'slim'

gem "puma", "2.6.0"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'memcache-client'
  gem 'rspec-rails', '~> 2.10.0'
  gem 'factory_girl_rails'
  gem 'capybara', :require => false
  gem 'letter_opener'
  gem 'thin'
  gem 'better_errors'            #出错提示友好版
  gem 'binding_of_caller'     #出错提示友好版
end

group :production do
  gem 'dalli'
end
