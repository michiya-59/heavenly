FROM ruby:3.2.1

RUN apt update -qq && apt install -y postgresql-client
RUN mkdir /heavenly
WORKDIR /heavenly
COPY Gemfile /heavenly/Gemfile
COPY Gemfile.lock /heavenly/Gemfile.lock
RUN bundle install
RUN gem install foreman
COPY . /heavenly
ENV TZ Asia/Tokyo

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

