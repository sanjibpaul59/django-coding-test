# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM node:16-alpine AS development

# # Set a non-root user
# ARG USER=vscode
# ARG GROUP=docker
# ARG UID=1001
# ARG GID=1000

# RUN addgroup -S ${GROUP} && adduser -S -u ${UID} -G ${GROUP} ${USER}

# Set working directory
WORKDIR /frontend

# Copy only package files first to leverage caching
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy the entire project
COPY . .

# Set environment variables
ENV HOST=0.0.0.0
EXPOSE 8080

# Switch to non-root user
# USER ${USER}

# Command to run the development server
CMD ["yarn", "run", "dev"]

# # Intermediate image for development environment
# FROM development as dev-envs

# # Install additional tools or dependencies if needed
# RUN apk --no-cache update && apk --no-cache add git

# # Set additional configurations or commands for the development environment

# # Final production image
# FROM node:16-alpine AS production

# # Set working directory
# WORKDIR /frontend

# # Copy only package files first to leverage caching
# COPY package*.json ./

# # Install dependencies
# RUN yarn install --production

# # Copy the entire project
# COPY . .

# # Build the project for production
# RUN yarn run build

# # Optional: Use a smaller base image for the final production image
# FROM nginx:alpine AS production-final

# # Copy the built project from the previous stage
# COPY --from=production /frontend/dist /usr/share/nginx/html

# # Additional Nginx configurations if needed

# # Expose the port for Nginx
# EXPOSE 80

# # CMD or ENTRYPOINT instruction for Nginx
# CMD ["nginx", "-g", "daemon off;"]


# # Use an official Node runtime as the base image
# FROM node:16-alpine

# # Set the working directory in the container to /app
# WORKDIR /frontend

# # Copy package.json and package-lock.json files
# COPY package*.json ./

# # Install Vue.js dependencies
# RUN npm install

# # Install Vue.js CLI
# RUN npm install -g @vue/cli@4.5.0

# # Copy the rest of the current directory contents into the container at /front
# COPY . .

# # Build the Vue.js application
# # RUN npm run build

# # Expose port 8080 for Vue.js application
# EXPOSE 8080

# # Command to run the application
# CMD ["npm", "run", "dev"]

# # syntax=docker/dockerfile:1.4
# FROM --platform=$BUILDPLATFORM node:16-alpine AS development

# RUN mkdir /frontend
# WORKDIR /frontend

# COPY . .

# RUN yarn global add @vue/cli@4.5.0
# RUN yarn install
# ENV HOST=0.0.0.0
# EXPOSE 8080
# CMD ["yarn", "run", "dev"]

# FROM development as dev-envs
# RUN <<EOF
# apk update
# apk add git
# EOF

# RUN <<EOF
# addgroup -S docker
# adduser -S --shell /bin/bash --ingroup docker vscode
# EOF
# # install Docker tools (cli, buildx, compose)
# COPY --from=gloursdocker/docker / /
# CMD ["yarn", "run", "dev"]
