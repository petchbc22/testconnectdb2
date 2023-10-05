# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

COPY v11.5.8_linuxx64_dsdriver.tar.gz  .

COPY v11.5.8_linuxx64_odbc_cli.tar.gz  .



RUN tar -xzf v11.5.8_linuxx64_dsdriver.tar.gz -C /usr/src/app && \
    rm v11.5.8_linuxx64_dsdriver.tar.gz


RUN tar -xzf v11.5.8_linuxx64_odbc_cli.tar.gz -C /usr/src/app && \
    rm v11.5.8_linuxx64_odbc_cli.tar.gz
    
# Install project dependencies
RUN npm install

# Copy all source code to the working directory
COPY . .

# Expose a port that the app will listen on
EXPOSE 3000

# Define the command to run your Node.js application
CMD [ "node", "index.js" ]  # Replace "app.js" with the entry point file of your Node.js app
