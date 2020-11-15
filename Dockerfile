# use existing docker image as a base, 'alpine' means bare bones
FROM node:14.15.0-alpine as builder

# target dir in the container
WORKDIR /usr/shipmen-client

# prevents 'npm i' stage from running when other sources change
COPY package.json .
RUN npm i

# copy rest of the content to container
COPY . .

RUN npm run build


FROM nginx
# elastic beanstalk uses this to expose port for incoming traffic
EXPOSE 80
# reference previous 'builder' stage
COPY --from=builder /usr/shipmen-client/build /usr/share/nginx/html
