FROM alpine:3.18

RUN apk update && apk upgrade && apk add --no-cashe nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

