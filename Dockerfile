FROM python:latest

WORKDIR /app

RUN apt-get update && apt-get install -y git

ARG GIT_TOKEN
RUN git clone https://$GIT_TOKEN:x-oauth-basic@github.com/vyahello/snakegame-gui.git .
COPY requirements.txt .
RUN pip install -r requirements.txt

CMD ["python", "pysnake.py"]
