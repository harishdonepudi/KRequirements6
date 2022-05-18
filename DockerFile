FROM python

WORKDIR /app
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt .

ENV DB_URL=Dummyurl
ENV ACCESS_KEY=Dummyaccesskey
ENV SECRET_KEY=Dummysecretkey
#this runs when image is built
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000 

ENTRYPOINT [ "python" ,"app.py" ] 