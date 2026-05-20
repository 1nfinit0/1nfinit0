{ config, pkgs, ... }:

{
	imports = 
		[
			./hardware-configuration.nix
		];

	#Bootloader

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	
	boot.loader.timeout = 3;

	#System

	networking.hostName = "nixos";
	networking.networkmanager.enable = true;
	hardware.enableRedistributableFirmware = true;
	boot.kernelPackages = pkgs.linuxPackages_latest;	

	hardware.firmware = with pkgs; [
		linux-firmware
	];
	
	time.timeZone = "America/Lima";
	i18n.defaultLocale = "en_US.UTF-8";

	#Console

	console.keyMap = "la-latin1";
	services.xserver.xkb = {
		layout = "latam";
		variant = "";
	};

	#Graphics

	hardware.graphics.enable = true;

	#Hyprland
	
	programs.hyprland.enable = true;
	xdg.portal.enable = true;

	#Audio

	security.rtkit.enable = true;

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	#User
	
	users.users.tobi = {
		isNormalUser = true;
		description = "Tobi";
		extraGroups = [ "wheel" "networkmanager" ];
		shell = pkgs.zsh;
	};

	#Shell

	programs.zsh.enable = true;

	#Login

	services.greetd = {
		enable = true;

		settings = {
			default_session = {
				command =
					"${pkgs.tuigreet}/bin/tuigreet \
					--time \
					--cmd Hyprland";
				user = "greeter";
			};
		};
	};
	
	#Base Packages

	environment.systemPackages = with pkgs; [
		git
		wget
		curl
		unzip

		kitty
		neovim
		fastfetch

		brave

		networkmanagerapplet
	];

	#Allow Privative Software

	nixpkgs.config.allowUnFree = true;

	#-v

	system.stateVersion = "25.11";

	
}
