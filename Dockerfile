FROM python:3-slim
COPY . /usr/src
WORKDIR /usr/src/
RUN pip install -r requirements.txt
    apt install -y curl
ENV FLASK_APP=app.py
EXPOSE 5000
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:5000/ || exit 1
CMD ["flask","run","--host","0.0.0.0"]


