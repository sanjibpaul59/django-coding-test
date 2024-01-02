# Use an official Node runtime as the base image
FROM node:16-alpine

# Set the working directory in the container to /app
WORKDIR /frontend

# Copy package.json and package-lock.json files
COPY package*.json ./

# Install Vue.js dependencies
RUN npm install

# Copy the rest of the current directory contents into the container at /front
COPY . .

# Build the Vue.js application
RUN npm run build

# Expose port 8080 for Vue.js application
EXPOSE 8080

# Command to run the application
CMD ["npm", "run", "watch"]
