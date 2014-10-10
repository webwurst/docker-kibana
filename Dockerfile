from ubuntu:14.04
env DEBIAN_FRONTEND noninteractive

# java
run apt-get update && apt-get install -y default-jre-headless

# kibana
run apt-get update && apt-get install -y curl \
  && mkdir -p /opt/kibana \
  && curl -L https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA1.1.tar.gz \
    | tar -xz --directory /opt/kibana --strip-components 1

# conf
add envconf /usr/local/bin/
add kibana.yml.env /opt/kibana/config/
add kibana_run /usr/local/bin/

cmd ["kibana_run"]
expose 5601
