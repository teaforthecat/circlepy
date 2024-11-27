FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN circlepy create-db
RUN circlepy populate-db
RUN circlepy add-user -u admin -p admin
EXPOSE 5000
CMD ["circlepy", "run"]
