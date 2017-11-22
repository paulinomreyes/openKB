FROM alpine:3.5

RUN apk add --update nodejs

RUN adduser -u 1000 -S barry -G root
WORKDIR /var/openKB
RUN chown -R barry:root /var/openKB

COPY locales/ /var/openKB/locales/
COPY public/ /var/openKB/public/
COPY routes/ /var/openKB/routes/
COPY views/ /var/openKB/views/
COPY config/ /var/openKB/config/
COPY app.js /var/openKB/
COPY package.json /var/openKB/

RUN npm install

VOLUME /var/openKB/data


EXPOSE 4444

USER barry

ENTRYPOINT ["npm", "start"]
