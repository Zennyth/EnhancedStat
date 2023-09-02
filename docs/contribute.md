# 🍻 Contributing to this project

If you'd like to suggest improvements to this add-on or fix issues, you can raise a pull request or [raise an issue](https://github.com/zennyth/enhanced_stat/issues).

## 🧪 Unit testing

This project will use [gdUnit](https://github.com/MikeSchulze/gdUnit4) to ensure code quality. Every pull request that introduces new changes, such as nodes or additional methods, must also provide some unit tests inside the `test/` folder. Make sure your test is in the correct folder.

## ⚡ Adding a new node

If you want to introduce a new node, raise a pull request after checking the issues tab for any discussions on new nodes. It's a great place to gather feedback before implementing a new node. Ensure that you also introduce an icon for your node that follows the color scheme:

- Control: `#A5EFAC`
- Node2D: `#A3B4F0`
- Utility Node and Resource: `#E0E0E0`

Also, update the `README.md` file with the documentation for the newly introduced node.

## 📚 Adding documentation

If you're introducing a new feature or changing behavior, update the wiki accordingly. Modify the `/docs` folder inside the repository. To test your wiki locally, run the following command:
```bash
docsify serve ./docs
```
> 💡 [Learn more](https://docsify.js.org/#/?id=docsify) about how to use **docsify**.