{ config, ... }:
{
    time.timeZone = "America/Fortaleza";
    console.keyMap = "br-abnt2";
    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocales = [
            "en_US.UTF-8/UTF-8"
            "pt_BR.UTF-8/UTF-8"
            "fr_FR.UTF-8/UTF-8"
        ];
    };
}
