FROM ubuntu

RUN apt-get update

RUN apt-get -y install curl

# kibana
RUN curl -L https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz \
  | tar -xz --directory /usr/local/src --strip-components 1

# conf
COPY kibana.yml.env /usr/local/src/config/
COPY envconf /usr/local/bin/
COPY kibana_run /usr/local/bin/

CMD ["kibana_run"]
EXPOSE 5601
