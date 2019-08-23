Hi Matic Network folks! 👋

I'm Anuj, and first of all I'd like to thank you for letting me participate in your iOS engineer challenge. It's been a lot of fun, and honestly I've learned a lot.

# Goals
Our aim in this challenge was to build an app which demonstrates storing and retrieving data from Keychain and encrypting plain text values.

![](https://i.imgur.com/2UatcLY.gif)

# Things I think I’ve done well

- Implementing the Keychain Services.
- Stays true to the design goals. 
- The app is architected using MVC with Protocols.
- Proper Localization support with all strings encoded in the `Constants.swift` file.
- Each file is < 200 lines.

# Considerations

- I have used a Swift wrapper for Keychain utility methods (from [Ray Wenderlich tutorial on Keychain Services API](https://www.raywenderlich.com/9240-keychain-services-api-tutorial-for-passwords-in-swift)).
- I have also used Swift [wrapper](https://github.com/backslash-f/aescryptable) on native CommonCrypto for encrypting and decrypting plain text into AES.
- All Table View cells  are dequeued when they go off screen and put in the reuse queue. Since the image assets are available locally, the dequeuing and loading happens automatically in the background thread.
- The peek-preview-and-pop functionality is a native 3D Touch functionality which works on devices which support Force Touch. To mimic the Instagram-like long press and hold preview (for devices not having 3D Touch), I had to use a library which is provides the peek preview on any action or gesture.  [PeekView](https://github.com/itsmeichigo/PeekView).
- To implement peek and pop on both force touch enabled and non force touch phones, I created a `DetailViewController` scene which is a simple view to show the token symbol, title and code.
- For now, I have a static JSON file which is populated with Crypto tokens and their data, which can be easily changed to retrieving data from REST API.
- I have used a storyboard instead of using XIBs or Autolayout in code as this project's complexity is trivial in terms of UI Development. Ideally, I would probably use multiple XIB and Autolayout code for real world apps.

# Things I can improve

- There are some UI issues in the login/signup page, the login/signup button might fall behind the keyboard when the keyboard is present. I could have implemented keyboard dismissing or adjusting the view to move up when keyboard is visible.
- There are some places where I have not handled errors.
