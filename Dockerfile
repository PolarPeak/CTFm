FROM python:3
ENV PYTHONUNBUFFERED=1
WORKDIR /backend
COPY ./backend/requirements.txt /backend/
RUN pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple \
    && pip install --upgrade pip \
    && pip install -r requirements.txt \
    && pip install mysqlclient \
    && pip install uwsgi  \
    && pip install https://github.com/chibisov/drf-extensions/archive/master.zip

COPY backend /backend/

EXPOSE 8086

CMD ["uwsgi","--ini","script/uwsgi.ini"]