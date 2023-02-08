FROM python:latest
 
#labbels as key value pair
LABEL Maintainer="Aran_yogesh"

#any working directory can be chosen as per choice
#i have chosen /usr/app/src

WORKDIR /usr/app/src

#to copy the remote file at working directory in coatiner

COPY test.py ./

#Now the structure looks like this ' /usr/app/src/test
#cmd instruction should be used to run the software
#conatined by your image, along with any arguements

CMD [ "python", "./test.py" ]

