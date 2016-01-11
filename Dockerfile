FROM hiroakis/docker-sensu-server

# Enable Embedded Ruby
RUN sed -i -r 's/EMBEDDED_RUBY=false/EMBEDDED_RUBY=true/' /etc/default/sensu

# Install Mailer 2.5.4
RUN /opt/sensu/embedded/bin/gem install mail --version 2.5.4
RUN /opt/sensu/embedded/bin/gem install aws-ses

# Bake checks in
COPY resources/conf.d/* /etc/sensu/conf.d/