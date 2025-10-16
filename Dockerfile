#base image
FROM ubuntu     

RUN apt-get update
RUN apt-get install -y curl

#installing node.js on ubuntu
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get upgrade -y
RUN apt-get install -y nodejs

#copy files into the container :Copies files from your local machine into the container’s working directory
#COPY source dest
COPY package.json package.json
COPY package-lock.json package-lock.json
COPY index.js index.js

#Install Node.js Dependencies inside the container
RUN npm install

#When someone runs this container, execute node index.js.
ENTRYPOINT [ "node", "index.js" ]