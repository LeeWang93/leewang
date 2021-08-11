FROM python:3.9.0

WORKDIR /home/

RUN echo "testing1234"

RUN git clone https://github.com/LeeWang93/leewang.git

WORKDIR /home/leewang/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash","-c", "python manage.py collectstatic --noinput --settings=leewang.settings.deploy && python manage.py migrate --settings=leewang.settings.deploy && gunicorn leewang.wsgi --env DJANGO_SETTINGS_MODULE=leewang.settings.deploy --bind 0.0.0.0:8000"]