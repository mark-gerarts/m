{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      davidanson.vscode-markdownlint
      elmtooling.elm-ls-vscode
      haskell.haskell
      james-yu.latex-workshop
      justusadam.language-haskell
      ms-python.python
      ms-python.vscode-pylance
      stkb.rewrap
      valentjn.vscode-ltex
      yzhang.markdown-all-in-one

      # Some extensions that are not packaged (@todo):
      # - tuttieee.emacs-mcx
      # - mkaufman.HTMLHint
      # - ms-vscode-remote.remote-containers
      # - sjurmillidahl.ormolu-vscode
    ];

    userSettings = {
      "files.trimTrailingWhitespace" = true;
      "files.insertFinalNewline" = true;
      "files.trimFinalNewlines" = true;
      "files.autoSave" = "afterDelay";

      "editor.quickSuggestions" = {
        "comments" = true;
      };
      "editor.fontSize" = 17;
      "editor.fontFamily" = "'Fira Code', 'Droid Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'";
      "editor.renderWhitespace" = "none";
      "editor.cursorStyle" = "block";
      "editor.wordWrap" = "on";
      "editor.rulers" = [80];
      "editor.fontLigatures" = true;
      "editor.minimap.enabled" = false;
      "editor.tabSize" = 4;
      "editor.renderIndentGuides" = false;

      "workbench.colorTheme" = "Quiet Light";
      "workbench.tree.indent" = 24;
      "workbench.tree.renderIndentGuides" = "none";

      "update.mode" = "none";

      "debug.onTaskErrors" = "showErrors";

      "latex-workshop.latex.recipe.default" = "lastUsed";
      "latex-workshop.view.pdf.viewer" = "tab";
      "latex-workshop.latex.autoBuild.run" = "never";

      "rewrap.autoWrap.enabled" = true;

      "[elm]"."editor.formatOnSave" = true;

      "extensions.ignoreRecommendations" = false;
      "extensions.autoCheckUpdates" = false;
      "extensions.autoUpdate" = false;

      "[haskell]"."editor.defaultFormatter" = "sjurmillidahl.ormolu-vscode";
      "haskell.serverExecutablePath" = "/home/mark/.nix-profile/bin/haskell-language-server-wrapper";
      "haskell.trace.server" = "messages";

      "[nix]"."editor.tabSize" = 2;

      "[purescript]"."editor.defaultFormatter" = "nwolverson.ide-purescript";

      "python.languageServer" = "Jedi";

      "markdown.extension.toc.levels" = "2..6";
    };

    # See the emacs extension for inspiration:
    # https://github.com/whitphx/vscode-emacs-mcx/blob/main/keybindings.json
    keybindings = [
      {
        key = "alt+right";
        command = "workbench.action.nextEditor";
      }
      {
        key = "alt+left";
        command = "workbench.action.previousEditor";
      }
      {
        key = "ctrl+x ctrl+c";
        command = "workbench.action.closeAllEditors";
      }
      {
        key = "ctrl+x ctrl+k";
        command = "-workbench.action.closeAllEditors";
      }
      {
        key = "alt+enter";
        command = "editor.action.quickFix";
        when = "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+.";
        command = "-editor.action.quickFix";
        when = "editorHasCodeActionsProvider && editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+alt+b";
        command = "latex-workshop.build";
        when = "editorLangId == 'latex'";
      }
    ];

  };
}
