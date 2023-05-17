# Stage 1: Build the application
FROM composer:2.1 as build

WORKDIR /app

# Copy the composer.json and composer.lock files to the container
COPY composer.json composer.lock ./

# Install dependencies
RUN composer install --no-scripts --no-autoloader

# Copy the rest of the application code to the container
COPY . .

# Generate optimized autoloader
RUN composer dump-autoload --optimize

# Run any additional build tasks, such as compiling assets
# RUN php artisan ...

# Stage 2: Build the production image
FROM nginx:latest

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d

# Copy the built application from the previous stage
COPY --from=build /app /var/www/html

# Set the document root
WORKDIR /var/www/html

# Expose the port
EXPOSE 80
