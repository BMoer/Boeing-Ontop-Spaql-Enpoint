FROM ontop/ontop-endpoint
WORKDIR /opt/ontop
COPY input/production_systems.ttl input/production_systems.obda input/production_systems.docker.properties input/ 
COPY jdbc/postgresql-42.2.5.jar jdbc/
EXPOSE 80
ENTRYPOINT java -cp ./lib/*:./jdbc/* -Dlogback.configurationFile=file:./log/logback.xml \
        it.unibz.inf.ontop.endpoint.OntopEndpointApplication \
        --ontology=input/production_systems.ttl \
        --mapping=input/production_systems.obda \
        --properties=input/production_systems.docker.properties