FROM ubuntu

RUN apt-get update && apt-get -y install curl

WORKDIR /opt/kibana
ENV KIBANA_VERSION 4.1.1

RUN curl -SL https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz \
  | tar -xz --strip-components 1

RUN sed -i 's/elasticsearch_url: "http:\/\/localhost:9200"/elasticsearch_url: "http:\/\/elasticsearch:9200"/g' config/kibana.yml

CMD ["bin/kibana"]
EXPOSE 5601
