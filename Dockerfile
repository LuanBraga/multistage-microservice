FROM gcc:4.9 as imagem-compilador

WORKDIR /root
COPY ola.c .
RUN gcc -o ola_microservice ola.c

FROM ubuntu as imagem-runtime

COPY --from=imagem-compilador /root/ola_microservice .
CMD ["./ola_microservice"]
