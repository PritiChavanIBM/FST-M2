# Base Image
FROM node:18-alpine

# Work Directory
WORKDIR /usr/app
	
# COPY Files
COPY ./ ./
 
# Install Dependencies
RUN npm install

# Copy the rest of the files over
COPY . .

# Start the App
CMD ["npm", "start"]