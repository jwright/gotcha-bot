Gotcha Bot
==========

Gotcha. Gotcha where I want cha.

## DESCRIPTION

The Gotcha bot is a [Slack](http://slack.com) bot user that helps you get introduced to people.

The Gotcha Bot hangs out in your conference Slack channel and assigns you a person to meet if you choose to play the game.

You can play by DMing or mentioning the bot and mention that you want to play.

```
You: @gotcha I want in.

Gotcha: You got it.
Gotcha: Your target is Alan Turing. Once you meet, tell him your code is 3478. He will give you a code as well.

Gotcha: @alanturing Grace Hopper is looking for you. Your code is 3209 for her.

You: @gotcha I found Alan.

Gotcha: Great. What is the code?

You: 3209

Gotcha: Boom. You are a sniper.
```

## INSTALLATION

1. Create a new bot integration in Slack
1. Deploy this bot to Heroku (or your choice of hosting)
1. Update the `SLACK_API_TOKEN` to your API token you received from the integration
1. Add this bot to your Slack team
1. Enjoy the smiles

## RELEASING A NEW GEM

1. Bump the VERSION in `lib/gotcha-bot/version.rb`
1. run `bundle exec rake build`
1. Commit changes and push to GitHub
1. run `bundle exec rake release`

## CONTRIBUTING

1. Clone the repository `git clone https://github.com/jwright/gotcha-bot`
1. Create a feature branch `git checkout -b my-awesome-feature`
1. Codez!
1. Commit your changes (small commits please)
1. Push your new branch `git push origin my-awesome-feature`
1. Create a pull request `hub pull-request -b jwright:master -h your-account:my-awesome-feature`

## LICENSE

Copyright (c) 2016, [Brilliant Fantastic, LLC](http://brilliantfantastic.com).

This project is licensed under the [MIT License](LICENSE.md).
