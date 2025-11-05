# Use small Node base
FROM node:20-alpine

# Install any required OS packages (none strictly required here)
RUN apk add --no-cache bash

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json package-lock.json* ./
RUN npm install --production

# Copy server and html
COPY server.js .
COPY index.html .

# Expose port (dokploy / traefik will route to container port)
EXPOSE 3000

# Run as non-root user (creates user 'node' already exists in the base image)
USER node

# Start server (server reads process.env.PORT or falls back to 3000)
CMD ["node", "server.js"]
