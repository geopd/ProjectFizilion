FROM elytra8/projectfizilion:latest

RUN mkdir /Fizilion && chmod 777 /Fizilion
ENV PATH="/Fizilion/bin:$PATH"
WORKDIR /Fizilion

RUN git clone https://github.com/geopd/ProjectFizilion -b dragon /Fizilion

#
# Copies session and config(if it exists)
#
COPY ./sample_config.env ./userbot.session* ./config.env* /Fizilion/
#transfer

RUN curl -sL https://git.io/file-transfer | sh

# install required pypi modules
RUN pip3 install -r requirements.txt

#
# Finalization
#
CMD ["python3","-m","userbot"]
