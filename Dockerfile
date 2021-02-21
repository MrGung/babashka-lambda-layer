FROM clojure:tools-deps-alpine

RUN apk update && apk add --no-cache zip && apk add curl ca-certificates unzip && rm -rf /var/cache/apk/*

RUN mkdir -p /var/task/bin

# https://github.com/babashka/babashka/releases
RUN curl -L 'https://github.com/babashka/babashka/releases/download/v0.2.10/babashka-0.2.10-linux-static-amd64.zip' -o /tmp/bb.zip && \
  unzip /tmp/bb.zip && \
  mv bb /var/task/bin/bb
  

WORKDIR /var/task

ENV GITLIBS=".gitlibs/"

COPY bootstrap .
RUN chmod +x bootstrap bin/bb

COPY deps.edn .

RUN clojure -Sdeps '{:mvn/local-repo "./.m2/repository"}' -Spath > cp
COPY src/ src/

RUN ./bin/bb -cp $(cat cp) -m lambda.core --uberscript core.clj
RUN echo "#!/usr/bin/env bb" >> bin/babashka && \
    cat core.clj >> bin/babashka && \
    chmod +x bin/babashka

RUN zip -q -r babashka-runtime.zip bin/ bootstrap
