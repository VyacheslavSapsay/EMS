source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'activeadmin'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'enumerize'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pundit'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'auxiliary_rails'
group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop-ergoserv', git: 'https://github.com/ergoserv/rubocop-ergoserv', require: false
end

group :test do
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
end
