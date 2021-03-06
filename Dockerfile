FROM python:3.9.1

WORKDIR /home/

RUN echo "testing1234"

RUN git clone https://github.com/abel9851/blogger.git

WORKDIR /home/blogger/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=blogger.settings.deploy && python manage.py migrate --settings=blogger.settings.deploy && gunicorn blogger.wsgi --env DJANGO_SETTINGS_MODULE=blogger.settings.deploy --bind 0.0.0.0:8000"]