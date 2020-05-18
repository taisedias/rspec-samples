# RSpec Samples

Examples of RSpec inital concepts.

# Setup Development Environment

## Requirements

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [Docker](https://docs.docker.com/get-docker/)

## Steps

Run the following commands:

```
$ docker build -t rspec-samples .
$ docker run -v $PWD:/rspec-samples -it rspec-samples /bin/bash
```
