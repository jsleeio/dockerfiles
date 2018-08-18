FROM gcr.io/jsleeio-containers/alpine-ops:latest AS download
WORKDIR /tmp
USER 1000
RUN true \
  && curl -LO https://github.com/SLASHEM-Extended/SLASHEM-Extended/archive/slex-2.2.2.zip \
  && unzip slex-2.2.2.zip

FROM gcr.io/jsleeio-containers/alpine-cbuild:latest AS build
COPY --from=download /tmp/SLASHEM-Extended-slex-2.2.2/ /tmp/SLASHEM-Extended-slex-2.2.2/
WORKDIR /tmp/SLASHEM-Extended-slex-2.2.2
### Nethack/SlashEM docs processing requires col(1) utility in alpine package 'util-linux'
RUN apk add --no-cache util-linux ncurses-dev flex bison groff
RUN addgroup -g 1000 _slex && adduser -u 1000 -G _slex -h /slex -g 'SlashEM Extended' -D _slex
RUN sh sys/unix/setup.sh
RUN sed -i \
  -e 's,^\(PREFIX[[:space:]]*=[[:space:]]*\).*,\1/slex,' \
  -e 's,^\(GAMEUID[[:space:]]*=[[:space:]]*\).*,\1_slex,' \
  -e 's,^\(GAMEGRP[[:space:]]*=[[:space:]]*\).*,\1_slex,' \
  Makefile
RUN sed -i -e 's/"wizard"/"_wizard"/' include/config.h
RUN make -C src ../include/date.h
RUN make all
RUN make install

FROM gcr.io/jsleeio-containers/alpine-ops:latest
USER 0
COPY --from=build /slex/ /slex/
RUN addgroup -g 1000 _slex && adduser -u 1000 -G _slex -h /slex -g 'SlashEM Extended' -D _slex \
  && addgroup -g 1001 _wizard && adduser -u 1001 -G _wizard -g '_wizard' -D _wizard \
  && apk add --no-cache ncurses
RUN chown -R _slex:_slex /slex/local/slexdir && chmod u+s /slex/local/slexdir/slex
USER _wizard
ENV USER _wizard
ENV NETHACKOPTIONS 'nonumpadmessage,DECgraphics,!autopickup,!rest_on_space,pickup_types:!"$?,!verbose,catname:Monty,dogname:Lucy'
ENTRYPOINT /slex/local/bin/slex
