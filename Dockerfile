# Use the official Nginx image
FROM nginx:alpine

# Copy static website to Nginx html directory
COPY src/index.html /home/einfochips/Practice2/src/index.html
