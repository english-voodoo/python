FROM ubuntu:14.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
WORKDIR /tmp/python
ADD requirements.txt /tmp/python/
CMD pip install -qr requirements.txt
WORKDIR /opt/webapp
ADD app.py /opt/webapp/
EXPOSE 5000
CMD python app.py