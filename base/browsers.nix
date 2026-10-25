{ inputs, pkgs, ... }:
{
    hm.programs.helium = {
        enable = true;
        flags = [
            "--ozone-platform-hint=auto"
            "--password-store=basic"
        ];

        policies = {
            "BrowserSignin" = 0;
            "PasswordManagerEnabled" = false;
            "SyncDisabled" = true;
            "SpellcheckEnabled" = false;
            "SpellcheckLanguage" = [ "" ];
        };
    };

    hm.programs.firefox = {
        enable = true;
        package = pkgs.firefox-devedition;

        profiles."dev-edition-default" = {
            isDefault = true;
            settings = {
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "browser.urlbar.scotchBonnet.enableOverride" = false;
                "browser.newtabpage.activity-stream.topSitesMaxSitesPerRow" = 4;

                "browser.ml.enable" = false;
                "browser.ai.control.default" = "blocked";
                "browser.ai.control.sidebarChatbot" = "blocked";
                "browser.ai.control.smartTabGroups" = "blocked";
                "browser.ai.control.linkPreviewKeyPoints" = "blocked";
                "browser.ai.control.pdfjsAltText" = "blocked";

                "toolkit.telemetry.enabled" = false;
                "datareporting.healthreport.uploadEnabled" = false;
                "datareporting.policy.dataSubmissionEnabled" = false;
                "browser.tabs.crashReporting.sendReport" = false;
                "extensions.pocket.enabled" = false;
                "browser.shopping.experience2023.enabled" = false;

                "browser.newtabpage.activity-stream.showSponsored" = false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
                "browser.newtabpage.activity-stream.showRecentSaves" = false;
                "browser.newtabpage.activity-stream.feeds.smartshortcutsfeed" = false;

                "gfx.webrender.all" = true;
                "layers.acceleration.force-enabled" = true;

                "browser.topSites.useLatestHistory" = false;
                "browser.newtabpage.activity-stream.default.sites" = "";

                "network.prefetch.enable" = false;
                "browser.sessionhustory.max_total_viewers" = 0;
                "accessibility.force_disabled" = false;

                "browser.tabs.groups.smart.enabled" = false;
                "browser.tabs.hoverPreview.enabled" = false;
                "browser.tabs.hoverPreview.showThumbnails" = false;
                "browser.tabs.groups.hoverPreview.enabled" = false;
            };
        };

        policies = {
            AppAutoUpdate                 = false;
            BackgroundAppUpdate           = false;

            DisableFirefoxStudies         = true;
            DisableFirefoxScreenshots     = true;
            DisableForgetButton           = true;
            DisableMasterPasswordCreation = true;
            DisableProfileImport          = true;
            DisableProfileRefresh         = true;
            DisableSetDesktopBackground   = true;
            DisablePocket                 = true;
            DisableTelemetry              = true;
            DisableFormHistory            = true;

            BlockAboutConfig              = false;
            BlockAboutProfiles            = false;
            BlockAboutSupport             = false;

            DisplayMenuBar                = "never";
            DontCheckDefaultBrowser       = true;
            HardwareAcceleration          = true;
            OfferToSaveLogins             = false;
        };
    };
}
