FROM ruby:2.6.1

# Update the package lists before installing.
RUN apt-get update -qq && apt install -y vim nano

RUN apt-get update -q && \
    apt-get install -qy procps curl ca-certificates gnupg2 build-essential --no-install-recommends && apt-get clean

# RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.6.1"

# This installs
# * build-essential because Nokogiri requires gcc
# * common CA certs
# * netcat to test the database port
# * two different text editors (emacs and vim) for emergencies
# * the mysql CLI and client library
RUN apt-get install -y \
    build-essential \
    ca-certificates \
    netcat-traditional \
    emacs \
    vim \
    mysql-client \
    default-libmysqlclient-dev

# Install node from nodesource
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn \
  && apt-get install -y git

# Create a directory called `/workdir` and make that the working directory
ENV APP_HOME /workdir
RUN mkdir /workdir
WORKDIR /workdir

# Copy the Gemfile
COPY Gemfile /workdir/Gemfile
COPY Gemfile.lock /workdir/Gemfile.lock

RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm use 2.6.1"

# # Copy the project over
COPY . /workdir

# # Map port 3030 to the outside world (your local computer)
EXPOSE 3030

ENTRYPOINT ["sh", "./entrypoint.sh"]