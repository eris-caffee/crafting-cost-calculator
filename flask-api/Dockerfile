FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y lua5.4 lua-inifile lua-sql-mysql
RUN apt-get install -y mariadb-client libmariadb-dev
RUN apt-get install -y unzip wget curl
RUN apt-get install -y less emacs
RUN apt-get install -y cron

RUN adduser crafter
USER crafter
RUN pip install --user flask flask-cors mysql.connector

RUN echo "1 0 * * * /home/crafter/app/ttc-update.sh" | crontab -
RUN mkdir /home/crafter/app
RUN chown crafter.crafter /home/crafter/app
COPY --chown=crafter:crafter config.ini ttc-update* start-server.sh /home/crafter/app/
COPY --chown=crafter:crafter src /home/crafter/app/src/
RUN chmod 755 /home/crafter/app/start-server.sh

ENV FLASK_APP=app.py
EXPOSE 5000
CMD /home/crafter/app/start-server.sh