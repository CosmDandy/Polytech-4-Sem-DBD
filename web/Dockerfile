FROM python:3.11
WORKDIR /web
COPY requirements.txt /web
RUN pip3 install --upgrade pip -r requirements.txt
RUN pip3 install SQLAlchemy Flask-SQLAlchemy
COPY . /web
EXPOSE 5001