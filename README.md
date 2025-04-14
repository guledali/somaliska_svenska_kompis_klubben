# Somaliska Svenska Kompis Klubben

Somaliska Svenska Kompis Klubben är en gemenskapsorganisation dedikerad till att främja kontakter mellan somaliska och svenska gemenskaper. Vi erbjuder en plattform för kulturellt utbyte, inlärningsmöjligheter och sociala evenemang som bygger broar och skapar varaktiga vänskapsband.

## Technical Stack

- Ruby 3.3.6
- Ruby on Rails 8.0.2
- SQLite database
- Bootstrap for UI
- Turbo & Stimulus for enhanced interactivity
- System and model tests with Minitest

## Development Setup

### Installing Ruby and Rails

This project requires Ruby 3.3.6 and Rails 8.0.2. For detailed installation instructions, please refer to the [official Ruby on Rails installation guide](https://guides.rubyonrails.org/install_ruby_on_rails.html).

Quick installation summary:

1. Install Ruby using Mise version manager (recommended):

   **macOS:**
   ```
   brew install openssl@3 libyaml gmp rust
   curl https://mise.run | sh
   echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.zshrc
   source ~/.zshrc
   mise use -g ruby@3
   ```

   **Windows (WSL):**
   ```
   # Install WSL with Ubuntu
   wsl --install --distribution Ubuntu-24.04

   # Once Ubuntu is installed, open it and run:
   sudo apt update
   sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev

   # Install Mise version manager
   curl https://mise.run | sh
   echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
   source ~/.bashrc

   # Install Ruby globally with Mise
   mise use -g ruby@3
   ```

   **Ubuntu:**
   ```
   sudo apt update
   sudo apt install build-essential rustc libssl-dev libyaml-dev zlib1g-dev libgmp-dev
   curl https://mise.run | sh
   echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.bashrc
   source ~/.bashrc
   mise use -g ruby@3
   ```

2. Install Rails:
   ```
   gem install rails -v 8.0.2
   ```

3. Verify your installation:
   ```
   ruby --version   # Should show 3.3.6
   rails --version  # Should show 8.0.2
   ```

### Prerequisites

- Ruby 3.3.6
- Bundler
- SQLite3
- Node.js & Yarn

### Installation

1. Clone the repository


2. Install dependencies
   ```
   bundle install
   ```

3. Setup the database
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. Start the server
   ```
   rails server
   ```

5. Visit http://localhost:3000 in your browser

### Running Tests

```
rails test
rails test:system
```

### VS Code Setup

For an optimal development experience with Visual Studio Code, we recommend using the Ruby LSP extension by Shopify:

1. Install [VS Code](https://code.visualstudio.com/)

2. Install the [Ruby LSP extension](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp)

3. Configure VS Code settings for Ruby:
   ```json
   // .vscode/settings.json
   {
     "[ruby]": {
       "editor.defaultFormatter": "Shopify.ruby-lsp",
       "editor.formatOnSave": true,
       "editor.tabSize": 2,
       "editor.insertSpaces": true,
       "editor.semanticHighlighting.enabled": true,
       "editor.formatOnType": true
     },
     "rubyLsp.formatter": "rubocop"
   }
   ```

4. For debugging support, create a launch configuration:
   ```json
   // .vscode/launch.json
   {
     "version": "0.2.0",
     "configurations": [
       {
         "type": "ruby_lsp",
         "name": "Debug Rails",
         "request": "launch",
         "program": "${workspaceRoot}/bin/rails",
         "args": ["server"]
       },
       {
         "type": "ruby_lsp",
         "request": "launch",
         "name": "Debug test file",
         "program": "ruby -Itest ${relativeFile}"
       }
     ]
   }
   ```

The Ruby LSP extension provides:
- Semantic highlighting
- Code navigation and completion
- RuboCop integration for linting
- Formatting support
- Test running and debugging
- Documentation on hover

## Bidra

Vi välkomnar bidrag från gemenskapen! Tveka inte att skicka in pull requests eller öppna issues för att förbättra plattformen.

1. Forka repositoriet
2. Skapa din funktionsgren (`git checkout -b feature/amazing-feature`)
3. Commit dina ändringar (`git commit -m 'Add some amazing feature'`)
4. Pusha till grenen (`git push origin feature/amazing-feature`)
5. Öppna en Pull Request

## Framtidsplaner

- Användarautentisering och profiler
- Evenemangsregistrering och närvarohantering
- Flerspråkigt stöd (svenska, somaliska, engelska)
- Gemenskapsforum/diskussionsbräda
- Förbättrat mediagalleri med videostöd
- Adminpanel

## Licens

Detta projekt är licensierat under MIT-licensen - se LICENSE-filen för detaljer.

---

<p align="center">
  Bygger starkare gemenskaper tillsammans genom kulturellt utbyte och vänskap.
</p>
