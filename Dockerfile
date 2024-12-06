FROM gradescope/autograder-base:ubuntu-22.04

ENV TZ=America/Los_Angeles

COPY . /autograder/source/

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    chmod +x /autograder/source/setup.sh && \
    /autograder/source/setup.sh && \
    cp /autograder/source/run_autograder /autograder/ && \
    chmod +x /autograder/run_autograder && \
    mkdir /autograder/submission && \
    mkdir /autograder/results/

WORKDIR /autograder
