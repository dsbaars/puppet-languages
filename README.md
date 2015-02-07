# dsbaars-languages

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
5. [Reference](#reference)
6. [Limitations](#limitations)
7. [Development](#development)

## Overview

Installs programming languages and their tools commonly used by dsbaars, might be useful for others

## Module Description

Installs and configures the following:

- Oracle JDK 8 (and makes it default)
- PHP 5 (CLI and FPM)
- node.js
- Python (and virtualenv)

## Setup

### What languages affects

#### Java

- Adds PPA ppa:webupd8team/java
- If `accept_license` is true:
    - Installs oracle-java8-installer
    - Installs oracle-java8-set-default to make Java 8 default

#### node.js

Nothings more than puppetlabs-nodejs at the moment

#### PHP
- If `manage_repo` is true, adds debsury PPA
- Installs PHP 5 CLI, FPM
- Installs the following extensions
    - APCu
    - intl
    - cURL
    - mcrypt
    - imagick
    - PDO mysql
    - PDO pgsql
    - xsl

(Sufficient for Symfony 2)

#### Python

Nothings more than stankevich-python at the moment

## Usage

```puppet
class { '::languages::java':
    accept_license => true
}

class { '::languages::php':
    manage_repo => true
}

class { '::languages::nodejs':
    manage_repo => true
}

class { '::languages::python':
}
```

## Reference

As you can see in the section above, nothing special.

## Limitations

Only tested on Ubuntu 14.04

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.
