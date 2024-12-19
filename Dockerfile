# Use the official Node.js image as a base
FROM node:18 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock files
COPY package.json ./

# Install dependencies
RUN npm install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm build

# Start the app using Node.js
EXPOSE 3030
CMD ["npm", "start"]
