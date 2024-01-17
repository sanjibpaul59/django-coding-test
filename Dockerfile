# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM node:16-alpine AS development

WORKDIR /frontend

COPY package*.json ./

RUN yarn install

COPY . .

ENV HOST=0.0.0.0
EXPOSE 8080

# Command to run the development server
CMD ["yarn", "run", "dev"]