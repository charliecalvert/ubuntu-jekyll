FROM ubuntu:lunar
RUN apt update
RUN apt install -y ruby-full build-essential zlib1g-dev
RUN apt install -y ruby-bundler sudo
# install ruby
# RUN adduser ubuntu
RUN usermod -aG sudo ubuntu
RUN su -- ubuntu
RUN mkdir -p /home/ubuntu/gems
RUN chown -R ubuntu:ubuntu /home/ubuntu/gems
RUN chmod -R 755 /home/ubuntu/gems
RUN gem install jekyll bundler
RUN mkdir -p /home/ubuntu/.bundle
RUN chown -R ubuntu:ubuntu /home/ubuntu/.bundle
ENV HOME=/home/ubuntu
ENV GEM_HOME=/home/ubuntu/gems
ENV PATH=/home/ubuntu/gems/bin:$PATH
EXPOSE 4000
RUN ruby --version
RUN gem --version
WORKDIR /home/ubuntu/
RUN mkdir -p /home/ubuntu/my-awesome-site
RUN jekyll new my-awesome-site
RUN ls /home/ubuntu
WORKDIR /home/ubuntu/my-awesome-site
CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
RUN chown -R ubuntu:ubuntu /home/ubuntu/my-awesome-site
RUN chown -R ubuntu:ubuntu /home/ubuntu/.bundle
