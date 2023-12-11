{pkgs, ...}: {
	enable = true;
	userName = "EtoOnAmill";
	userEmail = "alezardo12@gmail.com";
	extraConfig = {
		credential.helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
		safe.directory = "/etc/nixos";
	};
	/*
	signing = {
		signByDefault = true;
		key = "A5AD00D2ECFD7409";
	};
	*/
}
