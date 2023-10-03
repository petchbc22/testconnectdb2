# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy all source code to the working directory
COPY . .

# Expose a port that the app will listen on
EXPOSE 3000

# Define the command to run your Node.js application
CMD [ "node", "index.js" ]  # Replace "app.js" with the entry point file of your Node.js app
