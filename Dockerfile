FROM node:20-alpine3.19

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose port 3000
EXPOSE 3000

# Define the command to run the application
CMD ["node", "app.js"]