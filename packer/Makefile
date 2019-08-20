CURRENT_DIR := $(shell pwd)
JSON = jupytervm.json

.PHONY: clean

packer: 
	wget https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip
	unzip packer_1.4.3_linux_amd64.zip

validate: packer
	./packer validate ${JSON}

build:
	./packer build ${JSON}

clean:
	rm -rf $(CURRENT_DIR)/builds
