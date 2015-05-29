FROM ubuntu

RUN apt-get update && apt-get -y install curl

WORKDIR /opt/kibana

RUN curl -SL https://download.elastic.co/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz \
  | tar -xz --strip-components 1

RUN sed -i 's/elasticsearch_url: "http:\/\/localhost:9200"/elasticsearch_url: "http:\/\/elasticsearch:9200"/g' config/kibana.yml

CMD ["bin/kibana"]
EXPOSE 5601
