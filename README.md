# logstash


To generate a self-signed cert:

    $ sudo openssl req -x509 -batch -nodes -days 7300 -newkey rsa:2048 -keyout logstash-forwarder.key -out logstash-forwarder.crt

