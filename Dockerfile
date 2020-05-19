From node:10

EXPOSE 8080

WORKDIR /usr/src/app

COPY package.json .

RUN npm install

CMD ["npm", "start"]

# The things that stay the same most should go at the end

COPY . .
