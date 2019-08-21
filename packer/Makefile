CURRENT_DIR := $(shell pwd)
JSON = jupytervm.json

.PHONY: clean

build: packer
	./packer build -var "git_sha=`git rev-parse --short HEAD`" ${JSON}

packer: 
	wget https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip
	unzip packer_1.4.3_linux_amd64.zip

validate: packer
	./packer validate ${JSON}

clean:
	rm -rf $(CURRENT_DIR)/builds
