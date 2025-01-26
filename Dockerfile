FROM node:12

ARG POSTGRES_USERNAME_ARG
ARG POSTGRES_PASSWORD_ARG
ARG POSTGRES_HOST_ARG
ARG POSTGRES_DB_ARG
ARG AWS_BUCKET_ARG
ARG AWS_REGION_ARG
ARG AWS_PROFILE_ARG
ARG JWT_SECRET_ARG
ARG URL_ARG

ENV POSTGRES_USERNAME=POSTGRES_USERNAME_ARG
ENV POSTGRES_PASSWORD=POSTGRES_PASSWORD_ARG
ENV POSTGRES_HOST=POSTGRES_HOST_ARG
ENV POSTGRES_DB=POSTGRES_DB_ARG
ENV AWS_BUCKET=AWS_BUCKET_ARG
ENV AWS_REGION=AWS_REGION_ARG
ENV AWS_PROFILE=AWS_PROFILE_ARG
ENV JWT_SECRET=JWT_SECRET_ARG
ENV URL=URL_ARG


## Create app directory
WORKDIR /usr/src/app
## Install app dependencies
## A wildcard is used to ensure both package.json AND package-lock.json are copied where available (npm@5+)
COPY package*.json ./
RUN npm ci 
## Bundle app source
COPY . .
EXPOSE 8080
CMD [ "npm", "run", "prod" ]
