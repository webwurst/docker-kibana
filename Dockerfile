FROM java:openjdk-7-jre

# kibana
RUN curl -L https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-beta3.tar.gz \
  | tar -xz --directory /usr/local/src --strip-components 1

# conf
COPY kibana.yml.env /usr/local/src/config/
COPY envconf /usr/local/bin/
COPY kibana_run /usr/local/bin/

CMD ["kibana_run"]
EXPOSE 5601
