# FROM node:8-slim

# WORKDIR /server

# COPY . /server
# RUN npm install

# EXPOSE 3000
# CMD [ "npm", "start" ]

#
# Builder stage.
# This state compile our TypeScript to get the JavaScript code
#
FROM node:12.13.0 AS builder

# WORKDIR /usr/src/app


COPY package*.json ./
COPY tsconfig*.json ./
COPY ./src ./src
# RUN npm install -g nodemon typescript@latest tslint
# RUN npm ci --quiet && npm run build
RUN npm install
RUN npm run checkUpdate
# RUN npm run build

#
# Production stage.
# This state compile get back the JavaScript code from builder stage
# It will also install the production package only
#
# FROM node:12.13.0-slim

# WORKDIR /app
# ENV NODE_ENV=production

# COPY package*.json ./
# RUN npm ci --quiet --only=production

# ## We just need the build to execute the command
# COPY --from=builder /usr/src/app/dist ./dist