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
