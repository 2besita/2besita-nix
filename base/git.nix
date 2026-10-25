{
    hm.programs = {
        git = {
            enable = true;
            settings = {
                user.name = "2besita";
                user.email = "2besita@proton.me";
                init.defaultBranch = "main";
                pull.rebase = true;
                credential.helper = "!gh auth setup-git";
            };
        };
    };
}
