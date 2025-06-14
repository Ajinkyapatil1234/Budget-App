FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential

# Set working directory
WORKDIR /app

# Copy gem dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy entire app
COPY . .

# Precompile assets, clear PID, and run server
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'"]
