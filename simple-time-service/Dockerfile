# Use a small official Node.js base image
FROM node:20-slim

# Create app directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install --only=production

# Copy app source
COPY index.js .

# Create non-root user and use it
RUN useradd -m appuser
USER appuser

# Expose port and run app
EXPOSE 8080
CMD ["npm", "start"]
