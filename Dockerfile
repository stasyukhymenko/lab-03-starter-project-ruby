FROM ruby:bullseye

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY . .

EXPOSE 4567

CMD ["ruby", "app.rb"]