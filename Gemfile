source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.3'
gem 'mysql2', '0.5.3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '5.0.7'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'pry-rails'
gem 'rails-i18n'
gem 'dotenv-rails' # 環境変数の管理をするgem
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'
gem 'active_hash'
gem 'jquery-rails'
gem 'haml-rails' #htmlをhamlにする為、記述した
gem 'font-awesome-sass' #アイコン

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  #rspec
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem "selenium-webdriver"
  gem 'rspec-its' # its メソッドga使用可能となる。
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

