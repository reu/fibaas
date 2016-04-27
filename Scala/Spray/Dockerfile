FROM rnavarro/fibaas:scala

WORKDIR /fibaas
ADD . .

RUN sbt compile

CMD ["sbt", "run"]
