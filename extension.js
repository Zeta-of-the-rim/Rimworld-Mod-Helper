const vscode = require('vscode');

function activate(context) {

  // Register a listener to watch for setting changes
  vscode.workspace.onDidChangeConfiguration(e => {
    handleSnippetSettingChanged(e); 
  });

  // Initial register on activation
  handleSnippetSettingChanged();

}

// Handler to register/unregister snippets

function handleSnippetSettingChanged(e) {

  // Get current value of snippet setting
  const enableSnippets = vscode.workspace.getConfiguration().get('RwMH.enableCompletions');
  vscode.window.showInformationMessage('Hello World from RimWorld Mod Helper!');
  // Register snippets if enabled
  if (enableSnippets) {
    vscode.languages.registerSnippetProvider(
      ["xml"], new SnippetsProvider());
  }

  // Otherwise unregister snippets
  else {
    vscode.languages.registerSnippetProvider(
      ["xml"],
      SnippetProvider.prototype
    );
  }

}

class SnippetsProvider {
  // Add the file Completions.jsonc  
  provideSnippets() {
    return [
      new vscode.CompletionItem("Completions.jsonc", vscode.CompletionItemKind.File),
    ]
  }

}

module.exports = {
  activate
}