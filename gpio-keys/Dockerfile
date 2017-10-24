FROM arm32v6/alpine as build

RUN apk update && apk add make gcc g++ flex bison git && \
        git clone https://github.com/NextThingCo/dtc.git && \
        cd dtc && make && make install PREFIX=/usr && \
        cd .. && rm dtc -rf \
        && rm -rf /var/cache/apk/*
        
COPY gpio-keys.dts .

RUN dtc -I dts -O dtb -o gpio-keys.dtbo gpio-keys.dts

FROM arm32v7/busybox

COPY --from=build /gpio-keys.dtbo /lib/firmware/nextthingco/gpio-keys.dtbo
ADD gpiokeys.sh /

CMD ["/bin/sh", "/gpiokeys.sh"]

