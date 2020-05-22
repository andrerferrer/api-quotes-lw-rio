Person.destroy_all
Quote.destroy_all

milene = Person.create! name: "Milene"
marcel = Person.create! name: "Marcel"
andre = Person.create! name: "Andre"
timi = Person.create! name: "Timi"
lucas_cardi = Person.create! name: "lucas cardi"

quotes = {
  milene: [
    'Do your flashcards!',
    'CLEAN YOUR SHIT!',
    'Dont push to heroku on the last 5 minutes',
    'Do your fucking dishes',
    'LUCAS, CLEAN YOUR SHIT!',
    'Hiiii Isaaaa(#supersweetvoice)! Hi everyone.',
    'Rest!',
    'DO YOGAAAA',
    'PUSH ON HEROKU',
    'DEMO AT 5',
    'BE ON TIME',
  ],

  marcel: [
    'anyone? anyone?',
  ],

  andre: [
    'Ctrl Shift C - your best friend after me'
  ],

  timi: [
    "I'm in love with Ruby",
    "Ruby's my new wife",
  ],

  lucas_cardi: [
    'My code works i dont know why'
  ],
}

quotes.keys.each do |person|
  quotes[person].each do |quote|
    Quote.create! content: quote, person: eval("#{person}")
  end
end
