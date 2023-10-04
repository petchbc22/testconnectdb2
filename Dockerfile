# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

RUN mkdir -p /opt/ibm && \
    curl -o /opt/ibm/db2cli.tar.gz ibm_data_server_driver_for_odbc_cli_linuxx64_v11.1.tar.gz && \
    tar -xzf /opt/ibm/db2cli.tar.gz -C /opt/ibm && \
    rm /opt/ibm/db2cli.tar.gz && \
    echo "/opt/ibm" > /etc/ld.so.conf.d/db2.conf && \
    ldconfig

# Install project dependencies
RUN npm install

# Copy all source code to the working directory
COPY . .

# Expose a port that the app will listen on
EXPOSE 3000

# Define the command to run your Node.js application
CMD [ "node", "index.js" ]  # Replace "app.js" with the entry point file of your Node.js app
