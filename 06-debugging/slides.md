## Cloud Foundry for Beginners <br />From Zero To Hero
### [06 How do I debug my app?](#/0)

> Gerhard Lazu

<p style="font-size: 50%; opacity: 0.2;">
  This content is copyright of CloudCredo. &copy; CloudCredo 2015. All rights reserved.
</p>

---

# [Feature](#/1)

```nohighlight
As a CF hero
I want to know what my CF app is doing
So that I can debug it
```

---

## [Let's push a](#/2) 500 [app](#/2)

```bash
# From the training home directory:
$ cd 06-debugging/web
$ cf push

...

urls: debug-app-unlanterned-eliminant.cfapps.io

...
```

<img src="images/500-index.png" style="background:none; border:none; box-shadow:none;" />

---

## [How do I](#/3) debug [my app?](#/3)

1. App logs
1. App events
1. Buildpack support
1. SSH access*

Note:
  Diego SSH not fully integrated into PWS

---

## 1. [App](#/4) logs

```bash
$ cf logs debug-app --recent

...

... [App/0] ERR ...  - RuntimeError - I am a bug, fix me:
... [App/0] ERR /home/vcap/app/config.ru:20:in `block in <class:Web>
```

```bash
$ cf logs debug-app # TAILS APP LOGS, CTRL + C to exit
```

---

## [Let's](#/5) fix [the app](#/5)

```bash
$ cf set-env debug-app FIXED true
$ cf restart debug-app
```

<img src="images/200-index.png" style="background:none; border:none; box-shadow:none;" />

> And now crash it!

---

## 2. [App](#/6) events

```bash
$ cf events debug-app

... description
... index: 0, reason: CRASHED, exit_description: 2 error(s) ...
...
```

> App will be automatically restarted, <br />no RESTARTED event is logged

Note:
  Notice that the most recent event is at the top

---

## 3. [Buildpack support](#/7)

* New Relic
* AppDynamics

> Included in Java buildpack

---

## New Relic [without <br />buildpack support](#/8)

```bash
$ cf create-service newrelic standard newrelic
$ cf bind-service debug-app newrelic
$ cf env debug-app
# Find your New Relic license key
```

```bash
# From the training home directory:
$ cd 06-debugging/web
# Replace YOUR-LICENSE-KEY
$ vim newrelic.yml
```

```bash
$ cf push
```

```bash
$ cf service newrelic
```

https://loadimpact.com/

Note:
  Create a New Relic service instance

  Provide app with New Relic license key

  Find New Relic Dashboard URL

  Generate some load via LoadImpact

---

## 4. SSH [access](#/9)

> Not fully integrated into PWS yet

---

# <span style="color: #8FF541;">DELIVERED</span>

```nohighlight
As a CF hero
I want to know what my CF app is doing
So that I can debug it
```
---

## [Any](#/11) questions?

> Questions cannot be stupid. Answers can.

---

# CF SUPERHERO

  * Setup [Skylight](https://www.skylight.io/) for app
  * Setup [Opbeat](https://opbeat.com/) for app
  * Learn about [CF Logging and Metrics](http://www.cfsummit.com/sites/cfs2015/files/pages/files/cfsummit15_king.pdf)
  * Send app logs to [Papertrail](https://papertrailapp.com/)

```bash
$ cf cups logdrain -l syslog://YOUR-PAPERTRAIL-LOG-DESTINATION
$ cf bind-service debug-app logdrain
# Check your Papertrail Events, no need to restart the app
```

<p style="font-size: 50%; opacity: 0.2;">
  This content is copyright of CloudCredo. &copy; CloudCredo 2015. All rights reserved.
</p>
