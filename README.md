## ZenTik
- Currently under development

# Point of Departure

I was inspired to create my own crypto app that would give me a quick summary of the state of the crypto markets (prices, volume, news, technology, etc) and, most importantly, as a challenge to myself in trying to architect an app that had clean code. 

# History

There are a lot of great crypto apps out there (currently using “CryptoWatch” on iOS) that do what I want. They are great apps, with lots of thought and engineering that have gone into them. 

However, I have always been dissatisfied with some of these respective apps. Most apps that I have come across only provide market data and trading functionality. They are great and very useful, but I’ve always wanted an app that could quickly summarise the technology powering the coin or token. 

What makes one coin/token different to another? What consensus algorithm is it using? Is it proof-of-work, proof-of-stake, delegated proof-of-stake, etc? When was it launched? Is it actively traded at all? The coin's/token's most recent news? This is the type of data I wanted to synthesise and see in an app.

So, hence my main goal, I wanted to use this idea to challenge myself and get better at my craft. 

# The Architecture

The project uses the MVVM design pattern and I have tried to keep the code clean by having each major function of the app separated into three layers: Domain, Platform and Application. 

The Domain is the bottom layer which contains the use cases for each feature of the app. It’s also where I store my models. 

The Platform is the middle layer that acts as the network layer and which contains the concrete implementations of the use cases. This layer also contains all the parser structs, which parse all the JSON received from the network calls. Once parsed, I then add the data into their respective models for use in the Application layer.

The Application layer contains all the ViewControllers, ViewModels and if necessary, the TableViewCells. 
