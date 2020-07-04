# Set up node environment
FROM node:14.4.0

# Specify a working directory in container
WORKDIR /usr/src/app

# Install tools & dependencies
COPY ./package*.json ./
RUN npm install

# Copy application source code and libraries
COPY ./ ./

# Build the application
RUN npm run build


# Set up a web-server
FROM nginx

# Expose port for network access
EXPOSE 80

# Copy the build to be served as static web application
COPY --from=0 /usr/src/app/build /usr/share/nginx/html
