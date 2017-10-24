FROM arm32v6/alpine

# Update and install packages needed to build retroarch
RUN apk update && apk add libgcc libstdc++ alsa-lib make gcc g++ git \
        sdl-dev sdl2-dev sdl && \
        mkdir -p /usr/lib/libretro && \
        git clone https://github.com/libretro/RetroArch.git && cd RetroArch && \
        ./configure --enable-sdl --disable-sdl2 --enable-floathard \
        --enable-neon --disable-opengl --disable-opengles --disable-vg \
        --disable-fbo --disable-egl --disable-pulse --disable-oss \
        --disable-x11 --disable-wayland --disable-ffmpeg --disable-7zip \
        --disable-libxml2 --disable-freetype && \
        make && make install && \
        cd .. && \
        rm -rf RetroArch && \
        git clone https://github.com/libretro/gambatte-libretro.git && \
        cd gambatte-libretro && \
        make -f Makefile.libretro && \
        mv gambatte_libretro.so /usr/lib/libretro/ && \
        cd .. && \
        rm -rf gambatte-libretro && \
        apk del make gcc g++ git sdl-dev sdl2-dev


RUN mkdir saves
RUN mkdir games
ADD startfretroarch.sh /
ADD retroarch.cfg /etc

ENV SDL_NOMOUSE=1

CMD ["/bin/sh", "/startfretroarch.sh"]
