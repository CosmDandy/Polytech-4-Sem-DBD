FROM python:3.11
COPY . /web
WORKDIR ./web
RUN pip3 install --upgrade pip -r requirements.txt
RUN pip3 install SQLAlchemy Flask-SQLAlchemy
EXPOSE 5001