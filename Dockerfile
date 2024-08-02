# Use the official Nginx image
FROM nginx:alpine

# Copy static website to Nginx html directory
COPY index.html /usr/share/nginx/html/index.html
