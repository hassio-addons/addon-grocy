# Home Assistant Community Add-on: Grocy

[Grocy][grocy] - ERP beyond your fridge is a powerful groceries & household
management solution for your home, delivering features like:

- Stock management
- Shopping list
- Recipes
- Chores & tasks
- Inventory
- and many more.

[Try out the online demo of Grocy][grocy-demo].

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Home Assistant add-on.

1. Search for the "Grocy" add-on in the Supervisor add-on store.
1. Install the "Grocy" add-on.
1. Start the "Grocy" add-on.
1. Check the logs of the "Grocy" add-on to see if everything went well.
1. Click on the "OPEN WEB UI" button to get into the interface of Grocy.
1. The default login is user: `admin` password: `admin`.
1. Enjoy the add-on!

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
culture: en
currency: USD
entry_page: stock
features:
  batteries: true
  calendar: true
  chores: true
  equipment: true
  recipes: true
  shoppinglist: true
  stock: true
  tasks: true
tweaks:
  chores_assignment: true
  multiple_shopping_lists: true
  stock_best_before_date_tracking: true
  stock_location_tracking: true
  stock_price_tracking: true
  stock_product_freezing: true
  stock_product_opened_tracking: true
  stock_count_opened_products_against_minimum_stock_amount: true
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`: Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `ssl`

Enables/Disables SSL (HTTPS) on the web interface of Grocy
Panel. Set it `true` to enable it, `false` otherwise.

### Option: `certfile`

The certificate file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `keyfile`

The private key file to use for SSL.

**Note**: _The file MUST be stored in `/ssl/`, which is the default_

### Option: `culture`

Is used for setting the language. Choose between:

- `cs` (Czech)
- `da` (Danish)
- `de` (German)
- `el_GR` (Greek - Greece)
- `en` (English)
- `en_GB` (English - United Kingdom)
- `es` (Spanish)
- `fi` (Finnish)
- `fr` (French)
- `he_IL` (Hebrew - Israel)
- `hu` (Hungarian)
- `it` (Italian)
- `ja` (Japanese)
- `ko_KR` (Korean - South Korea)
- `nl` (Dutch)
- `no` (Norwegian)
- `pl` (Polish)
- `pt_BR` (Portuguese - Brazil)
- `pt_PT` (Portuguese - Portugal)
- `ru` (Russian)
- `sk_SK` (Slovak - Slovakia)
- `sv_SE` (Swedish - Sweden)
- `ta` (Tamil)
- `tr` (Turkish)
- `zh_CN` (Chinese - China)
- `zh_TW` (Chinese - Taiwan)

### Option: `currency`

Determines the currency as displayed in the Grocy interface, specified by the
ISO4217 three digit currency code.

Examples: `USD`, `CAD`, `GBP` or `EUR`.

### Option: `entry_page`

Allows you to specify an custom homepage if desired.

You can use the one of the following values:

- `batteries`
- `calendar`
- `chores`
- `equipment`
- `mealplan`
- `recipes`
- `shoppinglist`
- `stock`
- `tasks`

By default the homepage is set to the stock overview.

### Option: `features`

Is used for enable or disable features in Grocy. Disabled features
are hidden from the web interface. The following features can be enabled
or disabled:

- `batteries`
- `calendar`
- `chores`
- `equipment`
- `recipes`
- `shoppinglist`
- `stock`
- `tasks`

Set it `true` to enable it, `false` otherwise.

### Option: `tweaks`

These options are used to tweak part of the core behavior of Grocy.
The following sub features can be enabled or disabled:

- `chores_assignment`
- `multiple_shopping_lists`
- `stock_best_before_date_tracking`
- `stock_location_tracking`
- `stock_price_tracking`
- `stock_product_freezing`
- `stock_product_opened_tracking`
- `stock_count_opened_products_against_minimum_stock_amount`

Set it `true` to enable it, `false` otherwise.

The following sub features can be set to specify a day (0-6), where 0 would
equal Sunday:

- `calendar_first_day_of_week`
- `meal_plan_first_day_of_week`

## Known issues and limitations

- Grocy support to provide custom lookup resources to lookup information
  on the internet based on the product barcode. This is currently not yet
  supported by the add-on.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases]
functionality.

Releases are based on [Semantic Versioning][semver], and use the format
of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented
based on the following:

- `MAJOR`: Incompatible or major changes.
- `MINOR`: Backwards-compatible new features and enhancements.
- `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Community Add-ons Discord chat server][discord] for add-on
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2019-2021 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[alpine-packages]: https://pkgs.alpinelinux.org/packages
[contributors]: https://github.com/hassio-addons/addon-grocy/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-grocy/112422?u=frenck
[frenck]: https://github.com/frenck
[grocy-demo]: https://demo-en.grocy.info
[grocy]: https://grocy.info/
[issue]: https://github.com/hassio-addons/addon-grocy/issues
[python-packages]: https://pypi.org/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-grocy/releases
[semver]: http://semver.org/spec/v2.0.0.htm
