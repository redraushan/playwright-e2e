# Difference between focal and specific docker image for playwright?
FROM mcr.microsoft.com/playwright:focal

WORKDIR /usr/src/app

# Copies package.json from project, single source for managing dependencies
COPY package.json /usr/src/app
RUN npm install

# Individual package installation not needed
# RUN npm install typescript@4.5.4
# RUN npm install playwright@1.17.1 @playwright/test@1.17.1
# RUN npx playwright install