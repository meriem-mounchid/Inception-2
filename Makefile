### MAKEFILE ###

DC=docker-compose
GREEN=\033[0;32m
RED=\033[0;31m
BLUE=\033[0;34m
YELLOW=\033[0;33m
AQUA=\033[36m
BOLD=\033[1m
END=\033[0m

INSTALLING_BANNER="\n\t$(BLUE) +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+\
\n\t |I|n|s|t|a|l|l|i|n|g| |D|o|c|k|e|r|\
\n\t +-+-+-+-+-+-+-+-+-+-+ +-+-+-+-+-+-+$(END)\n"

BUILDING_BANNER="\t$(GREEN) ______        _ _     _ _\
\n\t(____  \      (_) |   | (_)            \
\n\t ____)  )_   _ _| | _ | |_ ____   ____ \
\n\t|  __  (| | | | | |/ || | |  _ \ / _  |\
\n\t| |__)  ) |_| | | ( (_| | | | | ( ( | |\
\n\t|______/ \____|_|_|\____|_|_| |_|\_|| |\
\n\t                                (_____|$(END)"

MAKEFILE_BANNER="\n\t$(YELLOW)╔╦╗╔═╗╦╔═╔═╗╔═╗╦╦  ╔═╗\
\n\t║║║╠═╣╠╩╗║╣ ╠╣ ║║  ║╣\
\n\t╩ ╩╩ ╩╩ ╩╚═╝╚  ╩╩═╝╚═╝$(END)\n"

help:
	@echo $(MAKEFILE_BANNER)
	@echo "\tBy: $(RED)MISΛKI$(END) [mmounchi]\n"
	@echo "$(BOLD)Usage:$(END)\n   make $(AQUA)<target>$(END)\n"
	@echo "$(BOLD)Install:$(END)\n   $(AQUA)install$(END)\t\tInstall docker and docker-compose\n"
	@echo "$(BOLD)Build:$(END)\n   $(AQUA)build$(END)\t\tBuild docker-compose\n"
	@echo "$(BOLD)Down:$(END)\n   $(AQUA)down$(END)\t\tDown docker-compose\n"
	@echo "$(BOLD)Clean:$(END)\n   $(AQUA)clean$(END)\t\tRemove docker-compose\n"
	@echo "$(BOLD)Restart:$(END)\n   $(AQUA)all$(END)\t\t\tRemove and build docker-compose\n"
	@echo "$(BOLD)Help:$(END)\n   $(AQUA)help$(END)\t\t\tHow to use this Makefile\n"

all:
	@make clean
	@make build

install:
	@echo $(INSTALLING_BANNER)
	@echo "$(BLUE)-- Start Installing Docker --$(END)"
	-@chmod +x script.sh
	-@./script.sh
	@echo "$(GREEN)-- Docker Installed Successfully --$(END)"

build:
	@echo $(BUILDING_BANNER)
	@echo "$(BLUE)-- Docker-Compose Start Building --$(END)"
	-@$(DC) up --build -d
	@echo "$(GREEN)-- Docker-Compose Built Successfully--$(END)"

down:
	@echo "$(BLUE)-- Down Docker-Compose --$(END)"
	-@$(DC) down -v
	@echo "$(GREEN)-- Docker-Compose Removed Successfully--$(END)"
	
clean:
	@echo "$(RED)-- Removing Docker-Compose --$(END)"
	-@$(DC) down --rmi all -v --remove-orphans 
	-@docker rmi -f debian:buster
	-@rm -rf data/mariadb_data/*
	-@rm -rf data/wordpress_nginx/*
	@echo "$(GREEN)-- Docker-Compose Removed Successfully --$(END)"