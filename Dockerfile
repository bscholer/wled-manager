FROM python:3.11

WORKDIR /app

COPY ./requirements.txt ./requirements.txt

RUN pip install -r requirements.txt

COPY wled-backup.py .

RUN git config --global user.email "wled-backup@benscholer.com"
RUN git config --global user.name "wled-backup"
RUN git config --global --add safe.directory /backup

CMD ["python", "wled-backup.py", "--output", "/backup"]
