FROM node:carbon

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND
# package-lock.json are copied where available (npm@5+)
# Be sure to make your package.json and/or
# before running container
COPY package*.json ./

# If you are building your code for production
# RUN npm install --only=production
RUN npm install

# Bundle app source
COPY . .

EXPOSE 80

# Create a npm start script in your package.json.
# If you want to run a different command, change
# what is after CMD bellow. You can also leave it out,
# to do so comment out line bellow.
CMD ["npm", "start"]