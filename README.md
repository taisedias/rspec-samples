# RSpec Samples

Examples of RSpec inital concepts.

# Setup Development Environment

## Requirements

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Docker](https://docs.docker.com/get-docker/)

## Steps

1. Clone this repo:

```
$ git clone https://github.com/taisedias/rspec-samples.git
```

2. Access the root dir

3. Run the following commands:

```
$ docker build -t rspec-samples .
$ docker run -v $PWD:/rspec-samples -it rspec-samples /bin/bash
```
