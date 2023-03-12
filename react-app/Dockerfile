FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y less emacs wget curl

RUN adduser crafter

RUN mkdir /home/crafter/app

USER crafter
SHELL ["bash", "-l", "-c"]
WORKDIR /home/crafter

COPY --chown=crafter:crafter install-node.sh /home/crafter/
RUN /home/crafter/install-node.sh

USER root
RUN chown crafter.crafter /home/crafter/app
COPY --chown=crafter:crafter package.json start-server.sh /home/crafter/app/
COPY --chown=crafter:crafter public /home/crafter/app/public/
COPY --chown=crafter:crafter src /home/crafter/app/src/
RUN chmod 755 /home/crafter/app/start-server.sh

EXPOSE 3000
USER crafter
CMD /home/crafter/app/start-server.sh
